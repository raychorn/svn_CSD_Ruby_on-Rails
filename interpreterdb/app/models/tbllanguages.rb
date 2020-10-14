class Tbllanguages < ActiveRecord::Base
  attr_accessible :langname, :active
  belongs_to :tblscheduleassignments
end
