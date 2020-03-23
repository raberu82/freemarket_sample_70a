class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,               null: false, index:true
      t.integer :price,             null: false, index:true
      t.integer :users_id,          null: false, foreign_key: true
      t.integer :buyer_id,          null: false
      t.string :explanation,        null: false
      t.string :status,             null: false
      t.string :postage,            null: false
      t.integer :ship_form_address, null: false
      t.integer :shipping_days,     null: false
      t.string :brand
      t.timestamps
    end
  end
end
