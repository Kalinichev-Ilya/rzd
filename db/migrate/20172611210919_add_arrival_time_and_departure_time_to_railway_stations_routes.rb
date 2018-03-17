class AddArrivalTimeAndDepartureTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  change_table(:railway_stations_routes) do |t|
    t.column :arrival_time, :datetime, null: false
    t.column :departure_time, :datetime, null: false
  end
end
