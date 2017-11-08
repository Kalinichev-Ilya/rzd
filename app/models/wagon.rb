class Wagon < ApplicationRecord
  belongs_to :train

  # added for complete lesson-16, this validation is not needed
  validates :number, presence: true, uniqueness: { scope: %i[train_id],
                                                   message: 'This number already exists' }

  before_validation do
    self.number = train.wagons.pluck(:number).max + 1
  end

  def show_seats_count
    case type
    when 'SvWagon'
      { bottom_seats: bottom_seats }
    when 'CoupeWagon'
      { bottom_seats: bottom_seats, top_seats: top_seats }
    when 'EconomyWagon'
      { side_top_seats: side_top_seats, side_bottom_seats: side_bottom_seats,
        top_seats: top_seats, bottom_seats: bottom_seats }
    when 'SeatingWagon'
      { seating_seats: seating_seats }
    end
  end
end
