class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :number
      t.string :holder_name
      t.string :passport_data

      t.timestamps
    end
  end
end
