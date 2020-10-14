class HomeController < ApplicationController
  def index
    redirect_to url_for(:controller => 'reports', :action => 'showScheduleSummary')
  end
end
