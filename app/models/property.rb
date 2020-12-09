class Property < ApplicationRecord
  has_and_belongs_to_many :tenants, association_foreign_key: "user_id", join_table: "properties_users"
  belongs_to :owner, optional: true, foreign_key: "user_id"
  has_many :property_images

  def address
  "#{unit} / #{street}, #{city}"
  end

  def full_address
  "#{unit}  #{street}, #{city}, #{state}, #{postcode}"
  end

  #Geocoding
  after_validation :geocode
  geocoded_by :full_address
end
