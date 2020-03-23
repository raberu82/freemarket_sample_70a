class ChangeDataExplanationToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :explanation, :text
  end
end
