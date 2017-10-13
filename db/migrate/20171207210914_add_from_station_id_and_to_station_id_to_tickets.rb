class AddFromStationIdAndToStationIdToTickets < ActiveRecord::Migration[5.1]
  def self.up
    add_belongs_to :tickets, :from_station, index: true
    add_belongs_to :tickets, :to_station, index: true
  end
end
