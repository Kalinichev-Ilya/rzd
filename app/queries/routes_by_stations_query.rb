module RoutesByStationsQuery
  def self.call(first_station, last_station)
    return if first_station.nil? || last_station.nil?

    station = 'railway_stations_routes.railway_station_id'

    Route.joins(:railway_stations_routes).find_by("#{station}": [first_station, last_station])
  end
end
