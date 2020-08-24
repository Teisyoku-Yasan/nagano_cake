class Shipping < ApplicationRecord
	belongs_to :customer

	validates :postal_code, presence: true
	validates :street_address, presence: true
	validates :name, presence: true

	# お届け先のリストからフルアドレスを選ぶ時用
	def full_shipping_name
		self.postal_code + ' ' + self.street_address + ' ' + self.name
	end
end
