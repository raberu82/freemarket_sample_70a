class RenameShipFormAddressColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :ship_form_address, :ship_form_address_id
  end
end
