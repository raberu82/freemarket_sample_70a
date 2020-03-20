class ChangeDatatypeAncestryOfCategories < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :ancestry, :integer
  end
end
