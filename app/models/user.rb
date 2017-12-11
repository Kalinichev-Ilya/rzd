class User < ApplicationRecord
  has_many :tickets
  has_one :passport

  validates :name, presence: true

  def self.registration(passport)
    Passport.create!(idd: passport[:idd],
                     series: passport[:series],
                     issue_date: passport[:issue_date],
                     issuer: passport[:issuer],
                     division_code: passport[:division_code],
                     name: passport[:name],
                     surname: passport[:surname],
                     birth_date: passport[:birth_date])
    User.create!(name: passport.name, passport: passport)
  end

  def buy(ticket)
    tickets << ticket
  end
end
