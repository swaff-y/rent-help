class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.text :address
      t.integer :bedrooms
      t.text :description
      t.integer :bathrooms
      t.text :area
      t.integer :garage
      t.boolean :storage
      t.boolean :leased
      t.date :lease_start
      t.date :lease_end
      t.text :cover_image
      t.text :image_1
      t.text :image_2
      t.text :image_3
      t.text :image_4
      t.text :image_5
      t.text :image_6
      t.text :image_7
      t.text :image_8
      t.text :image_9
      t.text :image_10

      t.timestamps
    end
  end
end
