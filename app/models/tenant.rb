class Tenant < User
  has_and_belongs_to_many :properties
end
