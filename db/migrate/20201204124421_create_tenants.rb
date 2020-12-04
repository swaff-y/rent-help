class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.text :display_name
      t.text :name
      t.text :email
      t.text :phone
      t.text :password_digest
      t.boolean :verified

      t.timestamps
    end
  end
end
