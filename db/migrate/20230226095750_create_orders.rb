class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :merchant_id
      t.integer :status
      t.float :amount
      t.float :comission_percentage

      t.timestamps
    end
  end
end
