class ChangeDatatypePostageIdOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :postage_id, :integer
  end
end
