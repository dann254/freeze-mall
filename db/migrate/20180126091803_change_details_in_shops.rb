class ChangeDetailsInShops < ActiveRecord::Migration[5.1]
  def change
    change_column :shops, :account, :integer, unique: true
    change_column :shops, :name, :string, unique: true
  end
end
