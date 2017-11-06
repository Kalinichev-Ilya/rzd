class ChangeSeatsName < ActiveRecord::Migration[5.1]
  def change
    change_table :wagons do |t|
      t.rename :upper_seats_count, :top_seats
      t.rename :bottom_seats_count, :bottom_seats
    end
  end
end
