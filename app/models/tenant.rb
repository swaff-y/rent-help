class Tenant < User
  has_and_belongs_to_many :properties, association_foreign_key: "property_id",foreign_key: "user_id", join_table: "properties_users"
  has_many :tenant_ratings, foreign_key: "user_id"
end
