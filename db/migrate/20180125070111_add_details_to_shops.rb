class AddDetailsToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :account, :integer
  end
end
