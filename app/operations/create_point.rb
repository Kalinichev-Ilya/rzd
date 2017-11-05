module Operations
  module CreatePoint
    extend self

    def call(route, station, number)
      RailwayStationsRoute.create(route: route,
                                  railway_station: station,
                                  station_number: number)
    end
  end
end
