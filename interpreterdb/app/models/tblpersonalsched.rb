class Tblpersonalsched < ActiveRecord::Base
  attr_accessible :schedulecode, :personalid, :paid, :officeid
  set_table_name 'tblpersonalsched'
  belongs_to :tblscheduleassignments
end
