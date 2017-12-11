# Route.joins(:trains, :railway_stations_routes)
#      .where('railway_stations_routes.railway_station_id = ?
#             AND railway_stations_routes.railway_station_id = ?',
#             1, 16)

module TrainsByStationsQuery
  def self.sql(first_station, last_station)
    return if first_station.nil? || last_station.nil?

    <<-SQL
      SELECT railway_stations.title,
             railway_stations_routes.arrival_time,
             railway_stations_routes.departure_time,
             routes.name,
             trains.id,
             trains.number
      FROM railway_stations
      INNER JOIN railway_stations_routes
      ON railway_stations.id = railway_stations_routes.railway_station_id
      INNER JOIN routes
      ON railway_stations_routes.route_id = routes.id
      INNER JOIN trains
      ON routes.id = trains.route_id
      WHERE railway_stations_routes.railway_station_id = #{first_station}
      AND railway_stations_routes.railway_station_id = #{last_station}
    SQL
  end
end
