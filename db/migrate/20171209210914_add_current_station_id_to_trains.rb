class AddCurrentStationIdToTrains < ActiveRecord::Migration[5.1]
  def self.up
    add_belongs_to :trains, :current_station, index: true
  end
end
