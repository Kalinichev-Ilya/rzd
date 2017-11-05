class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :station_number, uniqueness: { scope: %i[route_id],
                                           message: 'scope message' }
end
