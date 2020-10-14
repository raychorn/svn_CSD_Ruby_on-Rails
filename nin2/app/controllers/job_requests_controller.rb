class JobRequestsController < ApplicationController

  ensure_valid_requester!

  def index
    @events = JobRequest.scoped
    @events = @events.after(params['start']) if (params['start'])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.js  { render :json => @events }
    end
  end

  # GET /job_requests/new
  def new
    @locations = schedulable_locations
    @job_request = job_requests.build
    @job_request.build_physical_address
    @job_request.build_virtual_address
    @certifications = Certification.all
    @job_types = JobType.all
  end

  # POST /job_requests/interpreters_available.json
  def interpreters_available
    job_request = JobRequest.new(params[:job_request])
    scheduler = JobScheduler.new(job_request)
    @interpreters = scheduler.possible_interpreters

    respond_to do |format|
      format.json { render json: @interpreters }
    end
  end

  # POST /job_requests
  # POST /job_requests.json
  def create
    @job_request = job_requests.build( params[ :job_request ] )

    if params[:add_to_address_book]
      location = schedulable_locations.build( params[ :job_request ][:physical_address_attributes] )
    location.save!
    end

    respond_to do |format|
      if @job_request.save
        offers = @job_request.scheduler.create_job_offers

        format.html { redirect_to root_path, notice: "Job Request Created" }
        format.json { render json: @job_request }
      else
        format.html { render action: "new" }
        format.json { render json: @job_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_requests/1
  # PUT /job_requests/1.json
  def update
    begin
      @job_request = job_requests.find( params[ :id ] )
    rescue ActiveRecord::RecordNotFound
      @job_request = nil
    end

    respond_to do |format|
      if @job_request && @job_request.update_attributes( params[ :job_request ] )
        format.html { redirect_to root_path, notice: "Job Requests Updated Successfully"}
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, notice: "Update Failed" }
        format.json { render json: @job_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_location

  end

  def show
    @job_request = JobRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_request }
      format.js { render :json => @job_request.to_json }
    end
  end
  
  private

  def job_requests
    current_user.person.job_requests  unless current_user.nil?
  end

  def schedulable_locations
    if !current_user.nil? && !current_user.person.nil? && current_user.person.organization
      current_user.person.becomes(Client).all_schedulable_locations
    else
      []
    end
  end

  def parse_datetime_params( label, hash=nil )
    hash ||= params
    DateTime.new( hash["#{label}(1i)"].to_i, hash["#{label}(2i)"].to_i, hash["#{label}(3i)"].to_i, hash["#{label}(4i)"].to_i, hash["#{label}(5i)"].to_i )
  end

end