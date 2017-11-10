class AddTypeToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :type, :string
  end
end
