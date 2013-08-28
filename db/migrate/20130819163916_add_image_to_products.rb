class AddImageToProducts < ActiveRecord::Migration
  
  def self.up
    add_attachment :users, :avatar
    add_column :products, :description, :text
  end

  def self.down
    remove_attachment :users, :avatar
    remove_column :products, :description
  end

end
