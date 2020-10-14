# ==== Class Attributes
#
# @!attribute years_experience
#   @return [Float]
#
# @!attribute miles_willing_to_travel
#   @return [Integer]
#
# ==== Class Relationships
#
# @!attribute notes
#   @return [Array<Note>]
#
# @!attribute availabilities
#   @return [Array<Availability>]
#
# @!attribute certifications
#   @return [Array<Certification>]
#
# @!attribute contracts
#   @return [Array<Contract>]
#
# @!attribute job_assignments
#   @return [Array<JobAssignment>]
#
class Interpreter < Person

  CENTS_PER_MILE = 45

  COMMISSION_RATE = 1.2

  has_many :skills, :class_name => 'Skill', :dependent => :destroy

  has_many :insurance, :class_name => 'Insurance', :dependent => :destroy
  
  has_one :payment_method, :class_name => 'PaymentMethod', :as => :payable, :dependent => :destroy

  has_many :notes, :class_name => 'Note', :as => :notable, :dependent => :destroy

  has_one :work_address, :class_name  => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :physical }

  has_many :availabilities, :class_name => 'Availability', :dependent => :destroy

  has_many :interpreter_certifications, :class_name => 'InterpreterCertification', :dependent => :destroy
  
  has_many :certifications, :through => :interpreter_certifications

  has_many :contracts, :class_name => 'Contract', :as => :contractable, :dependent => :destroy

  has_many :job_assignments, :class_name => 'JobAssignment'

  has_one :pricing_plan

  has_many :pricing_rates, :through => :pricing_plan

  has_many :job_offers

  accepts_nested_attributes_for :notes, :availabilities, :interpreter_certifications, :payment_method,
                                :insurance, :skills, :user, :work_address, :pricing_plan

  attr_accessible :notes_attributes, :availabilities_attributes, :interpreter_certifications_attributes,
                  :payment_method_attributes, :insurance_attributes, :skills_attributes, :years_experience, :miles_willing_to_travel,
                  :user_attributes, :work_address_attributes, :written_languages, :spoken_languages, :pricing_plan_attributes,
                  :interpreter_attributes, :mailing_address_attributes, :virtual_addresses_attributes, :work_same_as_mailing,
                  :payment_same_as_mailing, :normal_hour_rate, :rates, :after_hour_rate

  # The almighty validation
  #validates_presence_of :gender, :mailing_address, :work_address, :insurance, :payment_method, :miles_willing_to_travel


  # Returns interpreters who are close enough to the
  # given address based on their miles willing to travel
  #
  # @param String address
  # @return ActiveRecord::Relation
  def self.willing_to_travel_to( address )
    addresses = Address.
        joins('INNER JOIN people ON people.id = addresses.addressable_id AND addresses.addressable_type = "Person"').
        where("#{Address.distance_from_sql( address )} < people.miles_willing_to_travel")

    where( :id => addresses.collect { |addy| addy.addressable_id } )
  end

  def self.with_minimum_years_experience( years )
    raise "years must be numeric" unless years.is_numeric?
    raise "invalid years (#{years}" if years.to_f < 0
    return scoped if years == 0
    where('people.years_experience >= ?', years.to_f )
  end

  def self.available_on( datetime )
    plans = PricingPlan.available_during( datetime ).collect { |plan| plan.interpreter_id }
    where :id => plans
  end

  def self.with_gender( gender )
    case gender.to_s.downcase.to_sym
      when :male
        where( :gender => :male )
      when :female
        where( :gender => :female )
      when :any
        scoped
      else
        raise "invalid gender"
    end
  end

  def self.having_the_following_certifications( cert_ids )
    return scoped if cert_ids.nil? || cert_ids.empty?
    raise "a collection is required" unless cert_ids.respond_to?( :each )
    joins(:interpreter_certifications).
        where("interpreter_certifications.certification_id IN (?)", cert_ids )
  end

  # TODO need to find a better way to estimate driving distance, this is using a strait line
  def quote_job_request( job_request )
    quote = pricing_plan.quote( job_request )
    quote += work_address.distance_to( job_request.physical_address.to_coordinates, :mi ) * CENTS_PER_MILE if job_request.physical_address
    quote * COMMISSION_RATE
  end

#agreed to term
#max distance to travel
#skills -  years experience, primary language or learned, where/when learned
#ASL specialty skills - legal, medical, music, theatrical, speech, business meeting, blind/deaf, limited proficiency
#Liability insurance - Carrier name, Account #, Coverage Amount, Upload Scanned Copy of proof of Insurance
# Additional info required for CSD Certification:
# *ever arrested - if yes, date and reason
# *ever convicted of a felony - if yes, date, charge, court, and whether currently on probation
# Professional Liability insurance, TB test, Criminal Background check,  Memorandum of Agreement, Statement of Work, HIPAA compliance forms, and medical records.
#blacklist terps, clients, orgs

end
