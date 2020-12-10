class Owner < User
  has_many :properties, foreign_key: "user_id"
  has_many :owner_ratings, foreign_key: "user_id"
end
