class DropTableDeriveries < ActiveRecord::Migration[5.2]
  def change
    drop_table :deliveries
  end
end
