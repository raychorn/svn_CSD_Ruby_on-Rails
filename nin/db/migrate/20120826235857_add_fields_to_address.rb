class AddFieldsToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :county, :string
    add_column :addresses, :latitude, :float
    add_column :addresses, :longitude, :float
  end
end
