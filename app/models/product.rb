class Product < ActiveRecord::Base
  attr_accessible :color, :discount, :name, :price, :description
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  belongs_to :category

end
