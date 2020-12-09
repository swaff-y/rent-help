class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :type
      t.integer :rating
      t.integer :type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
