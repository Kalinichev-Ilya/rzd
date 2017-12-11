class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  before_validation

  validates :station_number, uniqueness: { scope: :route_id,
                                           message: 'Railway station already exists' }
  default_scope { order(:station_number) }
end
