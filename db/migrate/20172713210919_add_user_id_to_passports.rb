class AddUserIdToPassports < ActiveRecord::Migration[5.1]
  def self.up
    add_reference :passports, :user, index: true
  end
end
