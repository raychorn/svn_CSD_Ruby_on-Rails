# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute [r] created_at
#   @return [Date] when availability was created
#
# @!attribute [r] updated_at
#   @return [Date] when availability was update
#
# @!attribute mas90_id
#   @return [String] foreign key to an external accounting system
#
# ==== Class Relationships
#
#
# @!attribute notes
#   @return [Array<Note>]
#
# @!attribute contracts
#   @return [Array<Contract>]
#
# @!attribute mailing_address
#   @return [Address]
#
# @!attribute billing_address
#   @return [Address]
#
# @!attribute virtual_address
#   @return [Array<VirtualAddress>] types of communication identification such as voice, email, im, and text
#
class Client < Person

  has_one :billing_method, :class_name => 'BillingMethod', :as => :billable, :dependent => :destroy

  belongs_to :organization, :class_name => 'Organization', :inverse_of => :clients

  has_many :job_requests

  has_many :notes, :class_name => 'Note', :as => :notable, :dependent => :destroy

  has_many :schedulable_locations, :class_name => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :schedulable }

  accepts_nested_attributes_for :billing_method, :organization, :notes, :schedulable_locations

  attr_accessible :billing_method_attributes, :organization_attributes, :notes_attributes, :schedulable_locations_attributes
  attr_accessible :billing_method, :organization, :job_requests, :notes, :schedulable_locations

  # # Making sure the type is set correctly on assignment
  # def mailing_address=( address )
  # address.address_type=( 'mailing' ) if address.respond_to? :address_type=
  # super( address )
  # end
  def all_schedulable_locations
    (self.schedulable_locations | self.organization.schedulable_locations unless self.organization.nil?) || self.schedulable_locations
  end
  
  def all_billing_methods
    a = Array.new << (self.billing_method unless self.billing_method.nil?)
    b = Array.new << (self.organization.billing_method unless (self.organization.nil? || self.organization.billing_method.nil?))
    a | b
  end
end
