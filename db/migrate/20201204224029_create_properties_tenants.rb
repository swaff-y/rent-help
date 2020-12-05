class CreatePropertiesTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :properties_tenants do |t|
      t.integer :property_id
      t.integer :tenant_id
    end
  end
end
