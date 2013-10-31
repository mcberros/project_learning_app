class Product < ActiveRecord::Base
  attr_accessible :name, :category_id, :price, :discontinued
  belongs_to :category
end