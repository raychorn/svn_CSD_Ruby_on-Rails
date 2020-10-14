class Tblinterplang < ActiveRecord::Base
  attr_accessible :langid, :terpid
  set_table_name 'tblinterplang'

  def create_association(langid, terpid)
    obj = Tblinterplang.new(:langid => langid, :terpid => terpid)
    obj.save
  end

end
