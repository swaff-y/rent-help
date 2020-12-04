class CreateTenantProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :tenant_properties do |t|
      t.integer :tenant_id
      t.integer :property_id

      t.timestamps
    end
  end
end
