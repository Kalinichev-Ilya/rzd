class CoupeWagon < Wagon
  validates :bottom_seats, :top_seats, presence: true
end
