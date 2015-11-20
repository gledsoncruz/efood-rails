class Item < ActiveRecord::Base
	has_many :orders
	belongs_to :restaurant
	belongs_to :category
end
