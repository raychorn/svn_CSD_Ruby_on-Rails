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
# @!attribute date_from
#   @return [Date] start date of the schedule
#
# @!attribute date_to
#   @return [Date] end date of the schedule
#
# ==== Class Relationships
#
# @!attribute pricing_rate
#   @return [pricingRate]
class PricingBlockPeriod < ActiveRecord::Base

  attr_accessible :effective_date, :end_date, :start_time, :end_time, :day_of_week, :pricing_plan_id

  belongs_to :pricing_plan, :class_name => 'PricingPlan'

  enum_attr :day_of_week, %w( monday tuesday wednesday thursday friday saturday sunday )
  
  scope :before,  lambda {|end_date| {:conditions => ["end_date > ?", PricingBlockPeriod.format_date(end_date)] }}
  scope :after,   lambda {|effective_date| {:conditions => ["effective_date > ?", PricingBlockPeriod.format_date(effective_date)] }}
  scope :my_plan, lambda {|p| where("pricing_plan_id = ?", p) unless p.nil?}

  def as_json(options = {})
    {
      :id           =>  self.id,
      :title        =>  'Block dude',
      :period       =>  self.effective_date.strftime("%m/%d/%Y") + ' - ' + self.end_date.strftime("%m/%d/%Y"),
      :period_time  =>  self.start_time.strftime("%l:%M %p") + ' - ' + self.end_time.strftime("%l:%M %p"),
      :start        =>  effective_date.rfc822,
      :end          =>  end_date.rfc822,
      :start_time   =>  start_time.rfc822,
      :end_time     =>  end_time.rfc822,
      :day_week     =>  day_of_week,
      :allDay       =>  '',
      :url          =>  Rails.application.routes.url_helpers.pricing_block_period_path(id)
    }    
  end
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end  
end
