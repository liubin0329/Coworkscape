class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.decimal :price
      t.string :per
      t.integer :space_id
      t.integer :user_id

      t.timestamps
    end
  end
end
