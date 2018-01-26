class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.text :description
      t.string :country
      t.string :city
      t.string :payment
      t.timestamps
    end
  end
end
