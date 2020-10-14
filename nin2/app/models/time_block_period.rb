module TimeBlockPeriod
  attr_accessor :start_time, :end_time, :start, :endDate, :effective_date, :day_of_week
  BlockPeriod = Struct.new(:id, :start, :endDate, :start_time, :end_time, :day_of_week, :src, :allDay, :url, :effective_date)
  
  def get_calendar_blocks
    period_days = []
    @blocks = Array.new
    i = 0
    @block_days = PricingBlockPeriod.my_plan(current_user.person.pricing_plan.id) 
    @block_days.each do |block_day|
    
    # Get days from pricing block period so that we can find all occurrences between effective date and end date  
      unless period_days.include? block_day.day_of_week
        period_days << get_day_integer(block_day.day_of_week)
        @blocked_days = ((block_day.effective_date.to_date)..(block_day.end_date.to_date)).to_a.select {|d| period_days.include?(d.wday)}
        
        # Build array of time block days
        @blocked_days.each do |day|
#          if (i > 7 && i < 17)
            @blocks <<  BlockPeriod.new(block_day.id, day.strftime("%m/%d/%Y"), day.strftime("%m/%d/%Y"), block_day.start_time.strftime("%l:%M %p"), block_day.end_time.strftime("%l:%M %p"), block_day.day_of_week, 'timeblock', '', Rails.application.routes.url_helpers.pricing_block_period_path(block_day.id), block_day.effective_date.strftime("%m/%d/%Y"))
#          end
#          i = i+1
        end
        period_days << block_day.day_of_week
      end  
    end
    @blocks
  end

  private
  def get_day_integer(d)
    case d.to_s
      when 'sunday';    0  
      when 'monday';    1
      when 'tuesday';   2  
      when 'wednesday'; 3
      when 'thursday';  4  
      when 'friday';    5
      when 'saturday';  6        
    end  
  end
end