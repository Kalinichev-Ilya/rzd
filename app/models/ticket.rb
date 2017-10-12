class Ticket < ApplicationRecord
  validates :number, presence: true
  
  belongs_to :train, optional: true

  belongs_to :from_station, class_name: "RailwayStation", foreign_key: :from_station_id, optional: true
  belongs_to :to_station, class_name: "RailwayStation", foreign_key: :to_station_id, optional: true
end
