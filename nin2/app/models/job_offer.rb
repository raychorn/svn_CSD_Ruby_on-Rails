class JobOffer < ActiveRecord::Base

  attr_accessible :status

  belongs_to :job_request

  belongs_to :interpreter

  enum_attr :status, %w( ^pending accepted declined closed )

  scope :pending, lambda { where :status => :pending }

  def create_job_assignment
    assignment = JobAssignment.new
    assignment.client = job_request.client
    assignment.interpreter = interpreter
    assignment.scheduled_start = job_request.start_datetime
    assignment.estimated_end = job_request.start_datetime + ( job_request.duration_in_hours || 0 ).hours
    assignment.save
    assignment
  end

  def close_others_pending
    related_job_offers.pending.all? do |offer|
      offer.status = :closed
      offer.save
    end
  end

  # Fetches all other job offers for the same job_request
  def related_job_offers
    return [] unless job_request_id
    JobOffer.where( :job_request_id => job_request_id ).where("id != ?",[id])
  end

  def is_pending?
    status == :pending
  end

  def belongs_to?( user )
    user.id == person_id
  end

end
