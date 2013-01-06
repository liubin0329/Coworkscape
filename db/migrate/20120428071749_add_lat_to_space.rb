class AddLatToSpace < ActiveRecord::Migration
  def change
  add_column :spaces, :latitude, :decimal
  add_column :spaces, :longitude, :decimal
  end
end
