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
  
  # def seats_count_by_wagon_type
  #   berth_upper = wagons.berth.sum(:top_seats)
  #   berth_bottom = wagons.berth.sum(:bottom_seats)
  #   roomette_upper = wagons.roomette.sum(:top_seats)
  #   roomette_bottom = wagons.roomette.sum(:bottom_seats)
  #
  #   {
  #     berth: { upper: berth_upper, bottom: berth_bottom },
  #     roomette: { upper: roomette_upper, bottom: roomette_bottom }
  #   }
  # end
end
