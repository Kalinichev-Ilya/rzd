class RemoveGradeFromWagons < ActiveRecord::Migration[5.1]
  def change
    remove_column :wagons, :grade
  end
end
