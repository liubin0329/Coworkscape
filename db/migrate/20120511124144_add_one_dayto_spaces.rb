class AddOneDaytoSpaces < ActiveRecord::Migration
  def change
  add_column :spaces, :oneday, :boolean
  end
end
