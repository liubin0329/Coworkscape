class AddPhototoSpace < ActiveRecord::Migration
  def change
  add_column :spaces, :availability, :string
  add_column :spaces, :photo1_file_name, :string
  add_column :spaces, :photo1_content_type, :string
  add_column :spaces, :photo1_file_size, :integer
  add_column :spaces, :photo1_updated_at, :datetime
  add_column :spaces, :photo2_file_name, :string
  add_column :spaces, :photo2_content_type, :string
  add_column :spaces, :photo2_file_size, :integer
  add_column :spaces, :photo2_updated_at, :datetime
  add_column :spaces, :photo3_file_name, :string
  add_column :spaces, :photo3_content_type, :string
  add_column :spaces, :photo3_file_size, :integer
  add_column :spaces, :photo3_updated_at, :datetime
  end
end
