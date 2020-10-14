# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute [r] created_at
#   @return [Date] when this address was made
#
# @!attribute [r] updated_at
#   @return [Date] last time address was updated
#
# @!attribute billable_plan_id
#   @return [Integer]
#
# @!attribute billable_plan_type
#   @return [String]
#
# @!attribute title
#   @return [String]
#
# ==== Class Relationships
#
# @!attribute pricing_rate_schedules
#   @return [Array<pricingRateSchedule>]
#
# @!attribute billable_plan
#   @return [Contract]
#
# @!attribute interpreter
#   @return Interpreter
class PricingPlan < ActiveRecord::Base

  #rates effective from effective_date to end_date
  has_many :pricing_rates, :dependent => :destroy
  
  has_many :pricing_rate_premiums, :dependent => :destroy
  
  #periods of time that are blocked - no rate = no availability
  has_many :pricing_block_periods, :dependent => :destroy

  accepts_nested_attributes_for :pricing_rates, :pricing_rate_premiums, :pricing_block_periods

  belongs_to :interpreter

  attr_accessible :title, :pricing_rates_attributes, :pricing_rate_premiums_attributes, :pricing_block_periods_attributes

  # Scopes all pricing plans that have rates covering between a time range given
  def self.available_during( datetime )
    plans_with_rates_during_time( datetime ).plans_without_blocking_periods( datetime )
  end

  def quote( job_request )
    rates = self.pricing_rates.on_day( PricingPlan.extract_day( job_request.start_window ) ).effective_during( job_request.start_window ).all
    starting = PricingPlan.extract_time( job_request.start_window )
    ending = PricingPlan.extract_time( job_request.start_window + job_request.estimated_period )
    rates.select! { |rate| rate.covers_time?( starting, ending ) }
    uncovered_time = (ending - starting) - rates.inject(0) { |total,rate| total + rate.time_covered(starting,ending) }
    padded_pay = rates.first.nil? ? 0 : rates.first.amount_for_duration( uncovered_time )
    rates.inject(padded_pay) { |total,rate| rate.amount_covering( starting, ending ) + total }
  end

  private

  def self.extract_day( date )
    date.strftime('%A').downcase!
  end

  def self.plans_without_blocking_periods( datetime )
    query = PricingBlockPeriod
    query = query.where('day_of_week = :day OR (effective_date <= :date AND end_date >= :date)', :day => extract_day(datetime), :date => datetime )
    query = query.where('start_time <= :time AND end_time >= :time', :time => extract_time(datetime) )
    query = query.select( :pricing_plan_id )
    plans = query.all.collect{ |rate| rate.pricing_plan_id }
    if plans.empty?
      scoped
    else
      self.where("\"pricing_plans\".\"id\" NOT IN (#{plans.join(',')})" )
    end
  end

  def self.plans_with_rates_during_time( datetime )
    query = PricingRate
    query = query.where('day_of_week = :day', :day => extract_day(datetime) )
    query = query.where('start_time <= :start', :start => extract_time(datetime) )
    query = query.where('end_time >= :end', :end => extract_time(datetime) )
    query = query.where('effective_date <= :date', :date => datetime )
    query = query.where('(end_date IS NULL OR end_date >= :date)', :date => datetime )
    query = query.select( :pricing_plan_id )
    self.where( :id => query.all.collect { |rate| rate.pricing_plan_id } )
  end

  def self.extract_time( date )
    Time.at( date.send( :hour ).hours + date.send( :min ).minutes + date.send( :sec ).seconds ).utc
  end

end
