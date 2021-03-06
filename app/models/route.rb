class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true,
                   format: { with: /\A[a-z-]+([- ])?[a-z-]+\z/i,
                             message: "Name doesn't match with format." },
                   length: { in: 6..30 },
                   uniqueness: true
  
  def station_number(station)
    railway_stations_routes.find_by(railway_station: station)&.position
  end
  
  def first_station
    railway_stations.first
  end
  
  def last_station
    railway_stations.last
  end
end
