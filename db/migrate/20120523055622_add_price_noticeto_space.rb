class AddPriceNoticetoSpace < ActiveRecord::Migration
  def change
  add_column :spaces, :visa, :boolean
  add_column :spaces, :price_notice, :string
  end
end
