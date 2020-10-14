class Tblscheduleassignments < ActiveRecord::Base
  attr_accessible :jobnumber, :date, :timezone, :officeid, :locationid, :flagio, :servicegroupid, :clientid, :interpreterid, :statusid, :billinggroupid, :paygroupid, :personalid, :servicesforid, :taxrateid, :taxrate, :taxable, :languageid, :fromtime, :endtime, :servicecode, :requestedby, :requestedbyphone, :pagestatus, :ponumber, :requested, :enteredby, :entereddate, :invoicenumber, :invoicedate, :notes_interp, :notes_scheduler, :notes_invoice, :closed, :dateclosed, :payrolldate, :lockrates, :interpChanged, :codeflags, :address, :city, :state, :zipcode, :sameloc, :rateclass, :parentid

  has_one :tblclient, :foreign_key => "clientid"
  has_one :tblschedstatus, :foreign_key => "statusid"
  has_one :tblinterpreters, :foreign_key => "interpreterid"
  has_one :tblservicesfor, :foreign_key => "servicesforid"
  has_one :tblpersonalsched, :foreign_key => "personalid"
  has_one :tbllanguages, :foreign_key => "id"
end
