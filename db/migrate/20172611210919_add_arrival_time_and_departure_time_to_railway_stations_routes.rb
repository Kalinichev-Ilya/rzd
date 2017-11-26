class AddArrivalTimeAndDepartureTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :arrival_time, :datetime, null: false, default: Time.zone.now
    add_column :railway_stations_routes, :departure_time, :datetime, null: false, default: Time.zone.now + 1.day
  end
end
