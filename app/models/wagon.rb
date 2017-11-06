class Wagon < ApplicationRecord
  belongs_to :train

  # added for complete the lesson, it's not needed
  validates :number, presence: true, uniqueness: { scope: %i[train_id],
                                                   message: 'This number already exists'}
  validates :grade, inclusion: { in: %w[berth roomette],
                                 message: 'Invalid Type: wagon can be only roomette or berth.' }

  before_validation do
    self.number = train.wagons.count + 1
  end

  enum grade: {
    berth: 'berth',
    roomette: 'roomette'
  }
end
