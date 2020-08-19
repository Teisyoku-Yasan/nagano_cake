class Product < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :order_details, dependent: :destroy
	belongs_to :genre


	#消費税込みにする
	def syouhizei(price)
		@price = price * 1.08
		@price.round
	end
end
