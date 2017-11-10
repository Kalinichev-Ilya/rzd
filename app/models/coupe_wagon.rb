class CoupeWagon < Wagon
  validates :bottom_seats, :top_seats, presence: true
  
  def seats_info
    { bottom_seats: bottom_seats, top_seats: top_seats }
  end
end
