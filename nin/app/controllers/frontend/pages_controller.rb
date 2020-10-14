class Frontend::PagesController < ApplicationController
  

  def static_content
    debugger
    render params[:page].to_sym
  end

end