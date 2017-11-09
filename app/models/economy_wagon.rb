class EconomyWagon < Wagon
  validates :side_top_seats, :side_bottom_seats, :top_seats, :bottom_seats, presence: true
  
  def seats_info
    { side_top_seats: side_top_seats, side_bottom_seats: side_bottom_seats,
      top_seats: top_seats, bottom_seats: bottom_seats }
  end
end
