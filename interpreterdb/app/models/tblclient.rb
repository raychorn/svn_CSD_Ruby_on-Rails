class Tblclient < ActiveRecord::Base
  attr_accessible :officeid, :active, :clientabbrev, :clientname, :clienttag, :attn, :address1, :address2, :city, :state, :zip, :country, :billaddress1, :billaddress2, :billcity, :billstate, :billzip, :contact1, :contact1phone, :contact2, :contact2phone, :fax, :comments, :notes, :schedulingnotes, :taxable, :porequired, :defaultpo, :billgroupid, :minimumunits, :minimumamount, :reimburseexpenses, :locationid, :terms, :invoicecycle, :taxrateid, :billto, :invparamid, :miles, :MAS90ID, :CreationDate, :io_billgroupid, :io_minunits, :io_minamount, :ipaddress, :ioready, :iodatechecked, :iocheckedby, :email, :sf_acct_id, :rate_type, :timezone, :LSSID
  set_table_name 'tblclient'
  belongs_to :tblscheduleassignments
end
