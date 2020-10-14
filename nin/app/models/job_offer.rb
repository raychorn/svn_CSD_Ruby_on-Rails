class JobOffer < ActiveRecord::Base

  attr_accessible :status

  belongs_to :job_request

  belongs_to :interpreter, :foreign_key => 'person_id'

  enum_attr :status, %w( ^pending accepted declined )


end
