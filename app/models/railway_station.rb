class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_number').uniq }

  def update_number(route, number)
    station_route = station_route(route)
    station_route.update(station_number: number)
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  def arrival_time(route)
    station_route(route).arrival_time
  end

  def departure_time(route)
    station_route(route).departure_time
  end

  private

  def station_route(route)
    railway_stations_routes.where(route: route).first
  end
end
