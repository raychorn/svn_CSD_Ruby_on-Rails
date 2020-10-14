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

  #def after_sign_in_path_for(resource)
  #  successful_login_url_redirect
  #end

  protected

  def successful_login_url_redirect=(url)
    session[:login_redirect_url] = url
  end

  def successful_login_url_redirect
    session[:login_redirect_url] || current_user_path
  end

  def self.ensure_valid_requester!
    valid_requester_roles = ['client', 'deaf', 'client_admin']
    before_filter do
      if current_user.nil? || current_user.roles.select {|r| valid_requester_roles.include? r.name}.empty?
        redirect_to root_path, alert: "Invalid requester account"
      end
    end
  end

end
