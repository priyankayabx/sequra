class AddMerchantReceivedAmountToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :merchant_received_amount, :float
  end
end
