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
# @!attribute status
#   @return [String] "pending", "completed", "cancelled"
#
# @!attribute scheduled_start
#   @return [Date]
#
# @!attribute estimated_end
#   @return [Date]
#
# @!attribute actual_start
#   @return [Date]
#
# @!attribute actual_end
#   @return [Date]
#
# @!attribute client_billing_plan_id
#   @return [Integer]
#
# @!attribute interpreter_billing_plan_id
#   @return [Integer]
#
# @!attribute client_id
#   @return [Integer]
#
# @!attribute interpreter_id
#   @return [Integer]
#
# @!attribute job_request_id
#   @return [Integer]
#
# ==== Class Relationships
#
# @!attribute client
#   @return [Client]
#
# @!attribute interpreter
#   @return [Interpreter]
#
# @!attribute job_request
#   @return [JobRequest]
#
# @!attribute client_billing_plan
#   @return [BillingPlan]
#
# @!attribute interpreter_billing_plan
#   @return [BillingPlan]
class JobAssignment < ActiveRecord::Base

  attr_accessible :actual_end, :actual_start, :estimated_end, :scheduled_start,
                  :status, :client, :interpreter, :job_request, :client_billing_method, :interpreter_pricing_plan

  attr_accessible :client_billing_method_id, :interpreter_pricing_plan_id, :client_id, :interpreter_id, :job_request_id, :client_invoice_id, :interpreter_invoice_id
                  
  enum_attr :status, %w(pending completed invoiced cancelled)
  belongs_to :client
  belongs_to :interpreter
  belongs_to :job_request

  # TODO There is no longer a billing plan, what does it become now ?
  belongs_to :client_billing_method, :class_name => "BillingMethod", :foreign_key => "client_billing_method_id" # must have
  belongs_to :interpreter_pricing_plan, :class_name => "PricingPlan", :foreign_key => "interpreter_pricing_plan_id" # must have

  has_many :invoice_items
  has_many :interpreter_invoice_items, :through => 'invoice_items', :conditions => { :invoice_item_type => :interpreter }
  has_many :client_invoice_items, :through => 'invoice_items', :conditions => { :invoice_item_type => :client }

  belongs_to :interpreter_invoice, :class_name => "Invoice", :foreign_key => "interpreter_invoice_id"
  belongs_to :client_invoice, :class_name => "Invoice",  :foreign_key => "client_invoice_id"
  
  #This may change once I have a better understanding of how we want to display assignments
  scope :before,      lambda {|estimated_end| {:conditions => ["estimated_end < ?", JobAssignment.format_date(estimated_end)] }}
  scope :after,       lambda {|scheduled_start| {:conditions => ["scheduled_start > ?", JobAssignment.format_date(scheduled_start)] }}
  scope :interpreter, lambda {|u| where("interpreter_id = ?", u) unless u.nil?}
  
  def as_json(options = {})
    {
      :id               => self.id,
      :title            => '',
      :interpreter      => self.interpreter.first_name + ' ' + self.interpreter.last_name,
      :scheduled_start  => scheduled_start.rfc822,
      :estimated_end    => estimated_end.rfc822,
      :start            => actual_start.rfc822,
      :endDate          => actual_end.strftime("%m/%d/%Y"),
      :startTime        => actual_start.strftime("%l:%M %p"),
      :endTime          => actual_end.strftime("%l:%M %p"),
      :allDay           => '',
      :url              => Rails.application.routes.url_helpers.job_assignment_path(id)
    }    
  end
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end  
end
