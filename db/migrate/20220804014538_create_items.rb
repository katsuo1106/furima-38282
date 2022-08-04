class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :item_name,        null: false
      t.text :item_description,   null: false
      t.integer :category_id,     null: false
      t.integer :condition_id,    null: false
      t.integer :postage_id,      null: false
      t.integer :area_id,         null: false
      t.integer :delivery_day_id, null: false
      t.integer :price,           null: false
      t.integer :timestamps
    end
  end
end