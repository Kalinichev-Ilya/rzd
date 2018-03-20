class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :from_station, class_name: 'RailwayStation'
  belongs_to :to_station, class_name: 'RailwayStation'
  belongs_to :user, optional: true

  before_validation :generate_number

  validates :number, presence: true, uniqueness: true

  private

  def generate_number
    self.number = Ticket.last.number.to_i + 1
  end
end
