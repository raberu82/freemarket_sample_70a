class ChangeDatatypeShippingDaysIdOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :shipping_days_id, :integer
  end
end
