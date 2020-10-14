class Tblservicesfor < ActiveRecord::Base
  attr_accessible :servicesforid, :firstname, :lastname, :email, :address1, :address2, :city, :zip, :state, :phone, :altphone, :altphonedesc, :preferred, :warn, :comments, :officeid, :active, :schedcomments
  set_table_name 'tblservicesfor'
  belongs_to :tblscheduleassignments
end
