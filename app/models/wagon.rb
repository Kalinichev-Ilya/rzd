class Wagon < ApplicationRecord
  belongs_to :train

  # added for complete lesson-16, this validation is not needed
  validates :number, presence: true, uniqueness: { scope: %i[train_id],
                                                   message: 'This number already exists' }

  before_validation :set_number, on: :create

  def seats_info
    { side_top_seats: side_top_seats,
      side_bottom_seats: side_bottom_seats,
      top_seats: top_seats,
      bottom_seats: bottom_seats }
  end

  private

  def set_number
    self.number = if train.wagons.any?
                    train.wagons.maximum(:number) + 1
                  else
                    1
                  end
  end
end
