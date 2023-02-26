class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email_id
      t.float :total_commission_charged
      t.integer :disbursement_frequency
      t.datetime :live_on
      t.float :min_monthly_fee
      t.boolean :status

      t.timestamps
    end
  end
end
