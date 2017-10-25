class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :number
      t.string :grade, default: 'berth'
      t.integer :upper_seats_count, default: 0
      t.integer :bottom_seats_count, default: 0

      t.timestamps
    end
  end
end
