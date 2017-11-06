class AddAscToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :by_asc, :boolean
  end
end
