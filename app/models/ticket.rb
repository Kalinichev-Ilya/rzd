class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :from_station, class_name: 'RailwayStation'
  belongs_to :to_station, class_name: 'RailwayStation'
  belongs_to :user, optional: true

  before_validation :generate_number

  validates :number, presence: true, uniqueness: true

  private

  def generate_number
    nums = []
    chars = []
    3.times { nums << (0..9).to_a.sample }
    2.times { chars << ('A'..'Z').to_a.sample }

    self.number = "#{nums.join}-#{chars.join}"
  end
end
