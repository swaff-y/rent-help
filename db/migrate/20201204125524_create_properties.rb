class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.text :unit
      t.text :street
      t.text :city
      t.text :state
      t.text :postcode
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
      t.integer :owner_id
      
      t.timestamps
    end
  end
end
