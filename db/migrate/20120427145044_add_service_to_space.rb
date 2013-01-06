class AddServiceToSpace < ActiveRecord::Migration
  def self.up
    add_column :spaces, :post, :boolean
    add_column :spaces, :receipt, :boolean
    add_column :spaces, :scanner, :boolean
    add_column :spaces, :shredder, :boolean
    add_column :spaces, :locker, :boolean
    add_column :spaces, :projector, :boolean
    add_column :spaces, :whiteboard, :boolean
    add_column :spaces, :copy, :boolean
	add_column :spaces, :charger, :boolean
  end

  def self.down
    remove_column :spaces, :post, :boolean
    remove_column :spaces, :receipt, :boolean
    remove_column :spaces, :scanner, :boolean
    remove_column :spaces, :shredder, :boolean
    remove_column :spaces, :locker, :boolean
    remove_column :spaces, :projector, :boolean
    remove_column :spaces, :whiteboard, :boolean
    remove_column :spaces, :copy, :boolean
	remove_column :spaces, :charger, :boolean
  end
end
