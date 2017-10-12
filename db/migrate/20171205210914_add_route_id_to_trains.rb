class AddRouteIdToTrains < ActiveRecord::Migration[5.1]
  def self.up
    add_reference :trains, :route, index: true
  end
end
