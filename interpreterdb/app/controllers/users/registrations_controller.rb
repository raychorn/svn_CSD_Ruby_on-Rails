class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    ## Example - add a user_type enum to user for registration, add rolify/cancan role at registration
    # if current_user
        # current_user.add_role current_user.user_type
    # end
  end

  def interpreter_create
    if current_user

      # Look for simple rates
      if params[:rates]
        error = false
        availabilities = []
        avail = SimpleAvailability.new
        begin
          avail.start_day = :monday
          avail.end_day = :friday
          avail.start_time = params[:rates][:normal][:start].to_i.hours
          avail.end_time = params[:rates][:normal][:end].to_i.hours
          normal_rates = avail.to_pricing_rates
          normal_rates.each do |rate|
            rate.hourly_rate = params[:normal_hour_rate].to_i
          end
          avail.inverse_time!
          after_rates = avail.to_pricing_rates
          avail.start_day = :saturday
          avail.end_day = :sunday
          avail.start_time = 0
          avail.end_time = 24.hours - 1.second
          after_rates += avail.to_pricing_rates
          after_rates.each do |rate|
            rate.hourly_rate = params[:after_hour_rate].to_i
          end
          availabilities += ( normal_rates + after_rates )
        rescue
          error = true
          availabilities = []
        end
      end

    else
      redirect_to new_user_registration_url
    end
  end

  def interpreter_sign_up
    if current_user
      respond_to do |format|
        format.html #
      end
    else
      redirect_to new_user_registration_url
    end
  end

end