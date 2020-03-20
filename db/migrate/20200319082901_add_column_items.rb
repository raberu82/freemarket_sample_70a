class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category, :integer ,foreign_key: true
    add_column :items, :brand, :string
  end
end
