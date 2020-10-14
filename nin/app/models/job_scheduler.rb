class JobScheduler

  attr_reader :job_request

  def initialize(options={})
    @job_request = options.fetch(:job_request,default_job_request)
    yield self if block_given?
  end

  # Returns a list of interpreters that satisfy a job request
  def possible_interpreters
    interpreters = Interpreter.scoped
    interpreters = interpreters.willing_to_travel_to( job_address ) if job_address
    interpreters = interpreters.available_on( job_time )
    interpreters.with_gender( job_gender )
  end

  # Creates a list of new JobOffer objects based on the JobRequest that JobScheduler is using
  def create_job_offers
    possible_interpreters.collect do |i|
      offer = JobOffer.new
      offer.job_request = job_request
      offer.interpreter = i
      offer
    end
  end

  protected

  def default_job_request
    JobRequest.new
  end

  def job_gender
    job_request.gender_range ? job_request.gender_range : :any
  end

  def job_time
    job_request.start_datetime ? job_request.start_datetime : Time.now
  end

  def job_address
    if job_request.physical_address
      job_request.physical_address.empty? ? nil : job_request.physical_address.full_address
    else
      nil
    end
  end

end