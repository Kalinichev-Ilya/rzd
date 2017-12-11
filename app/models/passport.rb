class Passport < ApplicationRecord
  belongs_to :user, optional: true
end
