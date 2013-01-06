class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :zip
      t.string :pref
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :phone
      t.string :email
      t.string :organization
      t.integer :user_id

      t.timestamps
    end
  end
end
