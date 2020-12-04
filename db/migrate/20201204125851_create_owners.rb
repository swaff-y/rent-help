class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.text :display_name
      t.text :name
      t.text :email
      t.integer :phone
      t.text :password_digest
      t.boolean :verified
      t.integer :property_id

      t.timestamps
    end
  end
end
