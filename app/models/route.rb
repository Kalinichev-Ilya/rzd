class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true,
                   format: { with: /\A[a-z]+-? ?[a-z]+\z/i,
                             message: "Name doesn't match with format." },
                   length: { in: 6..20 },
                   uniqueness: true
end
