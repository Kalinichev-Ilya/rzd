class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validate :permissible_type, on: :create

  enum grade: {
    berth: 'berth',
    roomette: 'roomette'
  }

  private

  def permissible_type
    unless %w[berth roomette].include? grade
      errors.add(:type, 'Invalid Type: wagon can be only roomette or berth.')
    end
  end
end
