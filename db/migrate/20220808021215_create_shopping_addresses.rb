class CreateShoppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_addresses do |t|
      t.references :buyer,null: false, foreign_key: true
      t.string :post_code, null: false
      t.integer :prefecture_id,null: false
      t.string :city,null: false
      t.string :address,null: false
      t.string :building_name
      t.integer :phone_number, null: false
      t.timestamps
    end
  end
end
