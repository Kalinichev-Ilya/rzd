class User < ApplicationRecord
  has_many :tickets
  has_one :passport

  def self.registration(passport)
    user = User.create!(name: passport['name'])
    Passport.create!(user: user,
                     idd: passport[:idd],
                     series: passport[:series],
                     issue_date: passport[:issue_date],
                     issuer: passport[:issuer],
                     division_code: passport[:division_code],
                     name: passport[:name],
                     surname: passport[:surname],
                     birth_date: passport[:birth_date])
    user
  end

  def buy(ticket)
    tickets << ticket
  end

  # validates :name, presence: true

end
