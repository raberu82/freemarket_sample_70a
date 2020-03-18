class ChangeDataShippingDaysToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :shipping_days, :string
  end
end
