require_relative '../queries/trains_by_stations_query' # :(

class Search
  def self.call(from_station, to_station)
    sql = TrainsByStationsQuery.sql(from_station, to_station)
    ActiveRecord::Base.connection.execute(sql) if sql != nil
  end
end
