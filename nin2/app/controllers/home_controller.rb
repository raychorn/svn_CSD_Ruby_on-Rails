class HomeController < ApplicationController
  def index
    if !current_user.nil?
      if (current_user.has_role? :interpreter)
        @interpreter = Interpreter.find(current_user.person.id)
        render 'interpreter_dashboard'
      elsif !(current_user.roles.select { |r| ['client', 'deaf', 'client_admin'].include? r.name }.empty?)
        @client = Client.find(current_user.person.id)
        render 'client_dashboard'
      else
        redirect_to new_user_session_url
      end
    end
  end
end
