# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute [r] created_at
#   @return [Date] when this address was made
#
# @!attribute [r] updated_at
#   @return [Date] last time address was updated
#
# @!attribute recurring
#   @return [String] describes the frequency of which the request will happen, options are 'none', 'daily', 'weekly',
#   'biweekly', 'monthly', 'quarterly', 'yearly'
#
# @!attribute request_status
# => when request is first created, it is in 'unfilled' state.
# => when payment approval is done, request should be moved to 'pending' state and sent off to interpreters
# => when an interpreter is associated with the request, it should be moved to a 'filled' state and no longer available for filling.  Confirmation emails should be sent to client and terp
# => when both client and terp confirm the assignment, then request should be moved into a 'confirmed' state and a JobAssignment created.
#   @return [String] flag detailing where in the process the request is, options are 'unfilled', 'pending', 'filled', 'confirmed'
#
# @!attribute request_type
#   @return [String] options are 'site', 'vri'
#
# @!attribute start_datetime
#   @return [Date]
#
# @!attribute client_id
#   @return [Integer] foreign key for the Client to whom this job request belongs to
#
# @!attribute name
#   @return [String]
#
# @!attribute reference
#   @return [String] used by client to attach a reference id for their own records
#
# @!attribute start_window
#   @return [Date]
#
# @!attribute estimated_period
#   @return [Integer]
#
# @!attribute period_window
#   @return [Integer]
#
# @!attribute hourly_max_cents
#   @return [Integer]
#
# @!attribute total_max_cents
#   @return [Integer]
#
# @!attribute gender_range
#   @return [String] enum of three selections 'any', 'male', 'female'
#
# ==== Class Relationships
#
# @!attribute client
#   @return [Client]
#
# @!attribute physical_address
#   @return [Address]
#
# @!attribute virtual_address
#   @return [VirtualAddress]
#
# @!attribute criteria_certifications_desired
#   @return [Array<CriteriaCertification>]  non-required certification criteria
#
# @!attribute criteria_certifications_required
#   @return [Array<CriteriaCertification>] Criteria that must be held by an interpreter for the job_request
#
# @!attribute certifications_desired
#   @return [Array<Certification>]
#
# @!attribute certifications_required
#   @return [Array<Certification>]
class JobRequest < ActiveRecord::Base

  # TODO the client, physical_address, and virtual_address accessors may need to be nuked and refitted with nested workers
  attr_accessible :recurring, :request_status, :request_type, :start_datetime, :client, :physical_address, :virtual_address, :name, :reference, :description
  attr_accessible :estimated_period, :gender_range, :hourly_max_cents, :period_window, :start_window, :total_max_cents
  attr_accessible :job_type, :percent_interpreting, :services_for, :onsite_contact

  attr_accessible :client_id
  attr_accessible :services_for_id, :onsite_contact_id


  belongs_to :client
  belongs_to :services_for, :class_name => 'Person'
  belongs_to :onsite_contact, :class_name => 'Person'
  
  # For onsite
  has_one :physical_address, :class_name  => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :physical }

  # For VRI
  has_one :virtual_address, :class_name => 'VirtualAddress', :as => :virtual_addressable

  has_many :job_offers

  has_many :criteria_certifications_desired, :class_name => 'CriteriaCertification', :conditions => { :required => false }

  has_many :criteria_certifications_required, :class_name => 'CriteriaCertification', :conditions => { :required => true }

  has_many :certifications_desired, :through => :criteria_certifications_desired, :source => :certification

  has_many :certifications_required, :through => :criteria_certifications_required, :source => :certification

  has_many :criteria_skills, :class_name => 'CriteriaSkill'
  
  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :physical_address, :services_for, :onsite_contact
  attr_accessible :physical_address_attributes, :services_for_attributes, :onsite_contact_attributes

  # A fresh record has both of these baked in stock, it's a pain putting these in the code
  # everywhere when they are needed
  #after_initialize lambda { build_physical_address if new_record? }
  #after_initialize lambda { build_virtual_address if new_record? }
  
  monetize :hourly_max_cents
  monetize :total_max_cents

  enum_attr :gender_range, %w(^any male female)
  enum_attr :request_status, %w(unfilled pending filled confirmed) # on confirmed it should kick off an assignment
  enum_attr :request_type, %w(site vri)
  enum_attr :recurring, %w(none daily weekly biweekly monthly quarterly yearly)

  #This may change once I have a better understanding of how we want to display assignments
  scope :after, lambda {|start_datetime| {:conditions => ["start_datetime > ?", JobRequest.format_date(start_datetime)] }}

  def scheduler
    @scheduler ||= JobScheduler.new :job_request => self
  end

  
  # Need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => '',
      :client => self.client.first_name + ' ' + self.client.last_name,
      :name => self.name,
#     :description => self.description || "",
      :start => start_datetime.rfc822,
      :start_window => start_window.rfc822,
      :end => '',
      :allDay => '',
#     :recurring => false,
      :url => Rails.application.routes.url_helpers.job_request_path(id)
    }    
  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
  
end
