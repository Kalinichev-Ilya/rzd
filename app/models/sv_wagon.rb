class SvWagon < Wagon
  validates :bottom_seats, presence: true
  
  def seats_info
    { bottom_seats: bottom_seats }
  end
end
