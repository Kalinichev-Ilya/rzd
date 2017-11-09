class SeatingWagon < Wagon
  validates :seating_seats, presence: true
  
  def seats_info
    { seating_seats: seating_seats }
  end
end
