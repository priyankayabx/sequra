class AddOrderRefrenceNoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_refrence_no, :text
  end
end
