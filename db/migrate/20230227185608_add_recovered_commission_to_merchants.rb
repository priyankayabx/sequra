class AddRecoveredCommissionToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :recovered_commission, :float
  end
end
