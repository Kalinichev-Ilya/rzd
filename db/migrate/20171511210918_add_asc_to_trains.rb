class AddAscToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :search, :sorted_by_head, :boolean, null: false, default: true
  end
end
