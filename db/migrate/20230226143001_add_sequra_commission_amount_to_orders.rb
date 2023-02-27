class AddSequraCommissionAmountToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :sequra_commission_amount, :float
  end
end
