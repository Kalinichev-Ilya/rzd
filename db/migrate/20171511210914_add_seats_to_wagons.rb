class AddSeatsToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :side_top_seats, :integer
    add_column :wagons, :side_bottom_seats, :integer
  end
end
