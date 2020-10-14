class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  before_filter do
    if !current_user
      redirect_to new_user_session_url unless request.filtered_parameters["controller"] =~ /^devise\/|^users\/|^frontend\//
    elsif  current_user.roles.count == 0
      redirect_to user_choose_role_url unless request.filtered_parameters["controller"] =~ /^users\//
    end
  end

  protected

  def self.ensure_valid_requester!
    valid_requester_roles = ['client', 'deaf', 'client_admin']
    before_filter do
      if current_user.nil? || current_user.roles.select {|r| valid_requester_roles.include? r.name}.empty?
        redirect_to root_path, alert: "Invalid requester account"
      end
    end
  end

end
