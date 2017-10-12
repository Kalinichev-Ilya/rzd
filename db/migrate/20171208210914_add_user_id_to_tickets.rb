class AddUserIdToTickets < ActiveRecord::Migration[5.1]
  def self.up
    add_reference :tickets, :user, index: true
  end
end
