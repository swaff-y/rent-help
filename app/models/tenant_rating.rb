class TenantRating < Rating
  belongs_to :tenant, optional: true, foreign_key: "user_id"
end
