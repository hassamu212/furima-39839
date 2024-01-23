class CreateDeliveryaddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveryaddresses do |t|
      t.integer :address,                       null: false
      t.integer :prefecture_id,                 null: false
      t.string  :municipalities,                null: false
      t.string  :street_address,                null: false
      t.string  :building_name                
      t.string  :telephone_number,              null: false
      t.references :order,                      null: false, foreign_key: true
      t.timestamps
    end
  end
end
