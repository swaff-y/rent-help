class PropertyImage < ApplicationRecord
  belongs_to :property, optional: true
end
