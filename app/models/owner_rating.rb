class OwnerRating < Rating
  belongs_to :owner, optional: true, foreign_key: "user_id"
end
