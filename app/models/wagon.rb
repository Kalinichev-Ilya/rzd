class Wagon < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :grade, inclusion: { in: %w[berth roomette],
                                 message: 'Invalid Type: wagon can be only roomette or berth.' }

  enum grade: {
    berth: 'berth',
    roomette: 'roomette'
  }
end
