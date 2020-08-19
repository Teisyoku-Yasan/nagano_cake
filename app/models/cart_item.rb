class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	validates :quantity, presence: true

	def subtotal
		@price = product.price * quantity * 1.08
		"#{@price.to_i.to_s(:delimited)}"
	end

	def total
		@price = product.price * quantity * 1.08
	end

end
