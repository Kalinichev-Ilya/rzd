class Train < ApplicationRecord
  has_many :tickets
  has_many :wagons
  belongs_to :route, optional: true
  belongs_to :current_station,
             class_name: 'RailwayStation',
             foreign_key: :current_station_id,
             optional: true

  validates :number, presence: true

  def count(wagon_type, seats_type)
    wagons.where(type: wagon_type).sum(seats_type)
  end
end
