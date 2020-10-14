class AddBillingContactToBillingMethod < ActiveRecord::Migration
  def change
    add_column :billing_methods, :billing_contact, :string
  end
end
