class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type
      t.text :name
      t.text :email
      t.integer :phone
      t.text :password_digest
      t.boolean :verified

      t.timestamps
    end
  end
end
