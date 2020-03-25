class RenameShippingDaysColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :shipping_days, :shipping_days_id
  end
end
