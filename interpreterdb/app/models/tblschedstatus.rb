class Tblschedstatus < ActiveRecord::Base
  attr_accessible :schedgroup, :credit, :bgcolor, :fgcolor, :statusid, :processpay, :processbilling, :officeid, :active, :hold, :schedstatus, :interpOption, :isdefault
  set_table_name 'tblschedstatus'
  belongs_to :tblscheduleassignments
end
