class AddSeatingSeatsToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :seating_seats, :integer
  end
end
