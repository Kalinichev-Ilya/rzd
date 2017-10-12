class AddTrainIdToTickets < ActiveRecord::Migration[5.1]
  def self.up
    add_reference :tickets, :train, index: true
  end
end
