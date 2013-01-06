class G < ActiveRecord::Migration
def self.up
    add_column :spaces, :photo_file_name, :string
    add_column :spaces, :photo_content_type, :string
    add_column :spaces, :photo_file_size, :integer
    add_column :spaces, :photo_updated_at, :datetime
    add_column :spaces, :twentyfour, :boolean
    add_column :spaces, :drinks, :boolean
    add_column :spaces, :conference, :boolean
    add_column :spaces, :pet, :boolean
    add_column :spaces, :phone_machine, :boolean
    add_column :spaces, :fax, :boolean
    add_column :spaces, :printer, :boolean
    add_column :spaces, :wifi, :boolean
	add_column :spaces, :reg, :boolean
	add_column :spaces, :weekends, :boolean
  end

  def self.down
    remove_column :spaces, :photo_file_name
    remove_column :spaces, :photo_content_type
    remove_column :spaces, :photo_file_size
    remove_column :spaces, :photo_updated_at
    remove_column :spaces, :twentyfour, :boolean
    remove_column :spaces, :drinks, :boolean
    remove_column :spaces, :conference, :boolean
    remove_column :spaces, :pet, :boolean
    remove_column :spaces, :phone_machine, :boolean
    remove_column :spaces, :fax, :boolean
    remove_column :spaces, :printer, :boolean
    remove_column :spaces, :wifi, :boolean
	remove_column :spaces, :reg, :boolean
	remove_column :spaces, :weekends, :boolean
  end
end