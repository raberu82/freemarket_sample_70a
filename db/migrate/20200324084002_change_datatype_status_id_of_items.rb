class ChangeDatatypeStatusIdOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :status_id, :integer
  end
end
