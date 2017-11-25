class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true

  def update_number(route, number)
    station_route = station_route(route)
    station_route.update(station_number: number)
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  private

  def station_route(route)
    railway_stations_routes.where(route: route).first
  end
end
