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

  def sorted_wagons
    return wagons.order(number: :asc) if sorted_by_head
    wagons.order(number: :desc)
  end
end
