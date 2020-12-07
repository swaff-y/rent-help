class Owner < User
  has_many :properties, foreign_key: "user_id"
end
