class Train < ApplicationRecord
  validates :number, presence: true
  
  belongs_to :route, optional: true
end
