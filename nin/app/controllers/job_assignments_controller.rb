class JobAssignmentsController < ApplicationController
  def index
    @events = JobAssignment.scoped  
    @events = @events.after(params['start']) if (params['start'])
    @events = @events.before(params['end']) if (params['end'])

    if current_user.has_role? :interpreter
      @events = @events.interpreter(current_user.id)
    end  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.js  { render :json => @events }
    end
  end
  def new
    @job_assignment = JobAssignment.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_assignment }
    end
  end 
  def show
    @job_assignment = JobAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_assignment }
      format.js { render :json => @job_assignment.to_json }
    end
  end 
end  