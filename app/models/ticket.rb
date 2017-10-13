class Ticket < ApplicationRecord
  validates :number, presence: true

  belongs_to :train

  belongs_to :from_station, class_name: 'RailwayStation'
  belongs_to :to_station, class_name: 'RailwayStation'

  belongs_to :user, optional: true
end
