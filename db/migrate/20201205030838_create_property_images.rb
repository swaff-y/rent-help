class CreatePropertyImages < ActiveRecord::Migration[5.2]
  def change
    create_table :property_images do |t|
      t.text :name
      t.text :image_url
      t.integer :property_id

      t.timestamps
    end
  end
end
