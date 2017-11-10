class AddAscToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sorted_by_head, :boolean, null: false, default: true
  end
end
