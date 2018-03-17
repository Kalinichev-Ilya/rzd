require_relative '../queries/routes_by_stations_query' # :(

class Search
  def self.routes(from_station, to_station)
    RoutesByStationsQuery.call(from_station, to_station)
  end
end
