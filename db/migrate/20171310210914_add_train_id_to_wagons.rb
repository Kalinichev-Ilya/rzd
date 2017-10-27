class AddTrainIdToWagons < ActiveRecord::Migration[5.1]
  def self.up
    add_belongs_to :wagons, :train, index: true
  end
end
