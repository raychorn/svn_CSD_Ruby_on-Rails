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

      Rails.logger.debug "(+++) params[:interpreter]=" + params[:interpreter].inspect
      Rails.logger.debug "(+++) params[:interpreter]=" + params[:interpreter]['first_name']
      @interpreter = Interpreter.new(:first_name => params[:interpreter]['first_name'])

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
          availabilities += (normal_rates + after_rates)
        rescue
          error = true
          availabilities = []
        end
      end

      # Look for similar addresses
      if params[:work_same_as_mailing] && params[:work_same_as_mailing] == "on"
        @interpreter.mailing_address.delete
        @interpreter.build_mailing_address(params[:interpreter][:mailing_address_attributes])
      end

      if params[:payment_same_as_mailing] && params[:payment_same_as_mailing] == "on"
        @interpreter.payment_method.build_mailing_address(params[:interpreter][:mailing_address_attributes])
      end

      @interpreter.user_id = current_user.id
      @interpreter.build_pricing_plan
      @interpreter.pricing_plan.pricing_rates = availabilities if availabilities

      if @interpreter.save
        current_user.add_role :interpreter
        redirect_to root_path
      else
        @certifications = Certification.all
        render :interpreter_sign_up
      end
    else
      redirect_to new_user_registration_url
    end
  end

  def interpreter_sign_up
    if current_user
      @certifications = Certification.all
      @interpreter = Interpreter.new
      @availability = SimpleAvailability.new

      @interpreter.build_payment_method
      @interpreter.payment_method.build_mailing_address
      @interpreter.payment_method.payment_type = :check
      @interpreter.build_mailing_address
      @interpreter.build_work_address
      @interpreter.build_pricing_plan

      @availability.start_time = 8.hours
      @availability.end_time = 16.hours
      @interpreter.pricing_plan.pricing_rates = @availability.to_pricing_rates

      respond_to do |format|
        format.html #
      end
    else
      redirect_to new_user_registration_url
    end
  end

  def choose_role

  end

  def client_create
    if current_user
      @client = Client.new(params[:client])
      @role = params[:role]
      # Look for similar addresses
      if params[:personal_billing_same_as_mailing] && params[:personal_billing_same_as_mailing] == "on"
        @client.billing_method.billing_address.delete
        @client.billing_method.build_billing_address(params[:client][:mailing_address_attributes])
      end
      if params[:org_billing_same_as_mailing] && params[:org_billing_same_as_mailing] == "on"
        @client.organization.billing_method.billing_address.delete
        @client.organization.billing_method.build_billing_address(params[:client][:organization_attributes][:mailing_address_attributes])
      end

      @client.user = current_user
      if @client.save
        current_user.add_role @role.to_sym
        redirect_to root_path
      else
        case (params[:role])
          when 'client'
            render 'client_sign_up'
          when 'deaf'
            render 'deaf_sign_up'
          when 'client_admin'
            render 'client_admin_sign_up'
          else
            redirect_to user_choose_role_url
        end
      end
    else
      redirect_to new_user_registration_url
    end
  end

  def client_sign_up
    if current_user
      @client = Client.new

      @client.build_billing_method
      @client.billing_method.build_billing_address
      @client.billing_method.billing_type = :cc
      @client.billing_method.cc_exp = Date.today

      @client.build_mailing_address

      @client.build_organization
      @client.organization.build_billing_method
      @client.organization.billing_method.build_billing_address
      @client.organization.billing_method.billing_type = :cc
      @client.organization.billing_method.cc_exp = Date.today
      @client.organization.build_mailing_address

      @organization = @client.organization

      case (params[:role])
        when 'client'
          render 'client_sign_up'
        when 'deaf'
          render 'deaf_sign_up'
        when 'client_admin'
          render 'client_admin_sign_up'
        else
          redirect_to user_choose_role_url
      end
    else
      redirect_to new_user_registration_url
    end
  end

end