class Route < ApplicationRecord
  validates :name, presence: true,
                   format: { with: /\A[a-z]+-? ?[a-z]+\z/i,
                             message: "Name doesn't match with format." },
                   length: { in: 6..20 },
                   uniqueness: true
end
