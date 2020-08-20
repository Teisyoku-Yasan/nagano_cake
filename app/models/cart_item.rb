class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	validates :quantity, presence: true

	#小計金額を計算しカンマをつける
	def subtotal
		@price = product.price * quantity * 1.08
		"#{@price.to_i.to_s(:delimited)}"
	end

	#小計金額を計算する(カンマなし・sum用)
	def total
		@price = product.price * quantity * 1.08
	end

end
