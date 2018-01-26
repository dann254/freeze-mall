class RemoveDetailsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :shop_profile, :boolean
  end
end
