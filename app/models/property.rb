class Property < ApplicationRecord
  has_and_belongs_to_many :tenants
  belongs_to :owner, optional: true
end
