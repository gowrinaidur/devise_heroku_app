class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.decimal :price
      t.string :color
      t.decimal :discount

      t.timestamps
    end
  end
end
