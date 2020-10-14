# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute [r] created_at
#   @return [Date] when availability was created
#
# @!attribute [r] updated_at
#   @return [Date] when availability was update
#
# @!attribute pricing_rate_schedule_id
#   @return [Integer]
#
# @!attribute start_time
#   @return [Time]
#
# @!attribute end_time
#   @return [Time]
#
# @!attribute title
#   @return [String]
#
# @!attribute increment_rate
# => the rate per increment_type unit
#   @return [Integer]
#
# @!attribute increment_type
# => the unit to apply to increment_rate
#   @return [String] enumeration of 'minute', 'hour', 'day', 'weekday', 'weekend', 'month', 'year'
#
# @!attribute min_increments
# the minimum increments any billing requires (ie, minimum 1 hr)
#   @return [Integer]
#
# @!attribute overtime_rate
# rate to apply when time has gone over the overtime_threshold
#   @return [Integer]
#
# @!attribute overtime_threshold
# after this number of hours, the overtime_rate then applies
#  @return [Integer]
#
# ==== Class Relationships
#
# @!attribute pricing_rate_schedule
#   @return [pricingRateSchedule]
#
class PricingRate < ActiveRecord::Base

  attr_accessible :title, :effective_date, :end_date, :start_time, :end_time, :day_of_week, :hourly_rate, :min_billing_amount, :overtime_rate, :overtime_threshold

  belongs_to :interpreter

  enum_attr :day_of_week, %w( monday tuesday wednesday thursday friday saturday sunday )
  
  belongs_to :pricing_plan, :class_name => 'PricingPlan'

  def amount_covering( beginning, ending )
    amount_for_duration( time_covered( beginning, ending) )
  end

  def amount_for_duration( seconds )
    ( seconds / 1.hour ) * hourly_rate
  end

  def time_covered( starting, ending )
    b = starting.change(:year=>2000,:day=>1,:month=>1)
    e = ending.change(:year=>2000,:day=>1,:month=>1)
    e = e.tomorow if e.hour == 0 && super.sec == 0 && super.min == 0
    case
      when in_range?(b) && in_range?(e)
        e - b
      when in_range?(b)
        end_time - b
      when in_range?(e)
        e - start_time
      when b < start_time && e > end_time
        end_time - start_time
      else
        0
    end
  end

  def covers_time?( starting, ending )
    time_covered( starting, ending ) > 0
  end

  def self.effective_during( datetime )
    where('effective_date <= :datetime AND (end_date IS NULL OR end_date >= :datetime)', :datetime => datetime )
  end

  def self.on_day( days )
    where(:day_of_week => days)
  end

  # When working with midnight - some fun stuff happens so we fast forward to the next day
  def end_time
    begin
      if super.hour == 0 && super.sec == 0 && super.min == 0
        super.tomorrow
      else
        super
      end
    rescue
      super
    end
  end

  private

  def in_range?(point)
    point >= start_time && point <= end_time
  end



end
