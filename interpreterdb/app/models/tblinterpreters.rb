class Tblinterpreters < ActiveRecord::Base
  attr_accessible :officeid, :interpreterssn, :gender, :firstname, :mi, :lastname, :address1, :address2, :city, :state, :zip, :country, :homephone, :workphone, :cellphone, :pager, :otherphonetype, :otherphone, :comments, :startdate, :enddate, :certificationlevel, :statusid, :paygroupid, :active, :locationid, :username, :password, :email, :email2, :liability_exp_date, :back_check_date, :tb_test_date, :birthday_date, :terpnet_access
  belongs_to :tblscheduleassignments
end
