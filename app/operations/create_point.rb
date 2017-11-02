module Operations
  module CreatePoint
    extend self
    
    def call(route, station, number)
      RailwayStationsRoute.where(route: route,
                                 railway_station: station).update(station_number: number)
    end
  end
end
