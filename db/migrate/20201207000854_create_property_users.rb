class CreatePropertyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :property_users do |t|
      t.integer :property_id
      t.integer :user_id
    end
  end
end
