class CreateJobOffers < ActiveRecord::Migration
  def change
    create_table :job_offers do |t|
      t.integer :job_request_id
      t.integer :interpreter_id
      t.enum :status

      t.timestamps
    end
  end
end
