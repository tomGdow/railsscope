class Product < ApplicationRecord
	CATEGORY_TYPES = ['fruit', 'car']
	scope :fruit, -> {where("category = ?","fruit")}
	scope :car, -> {where("category = ?","car")}
end
