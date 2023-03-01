class AddLiveOnDayToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :live_on_day, :integer
  end
end
