class Ticket < ApplicationRecord
  validates :number, presence: true
  
  belongs_to :train, optional: true
end
