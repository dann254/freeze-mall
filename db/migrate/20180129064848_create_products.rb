class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.belongs_to :shop, index: true
      t.string :name
      t.text :description
      t.string :category
      t.integer :price
      t.integer :quantity
      t.timestamps
    end
  end
end
