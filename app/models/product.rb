class Product < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :order_details, dependent: :destroy
	belongs_to :genre
	

	attachment :image

	validates :name, presence: true, length: {minimum: 1, maximum:15}
	validates :introduction, presence: true
	validates :image, presence: true
	validates :genre_id, presence: true
	validates :price, numericality: true
	validates :is_active, inclusion: {in: [true, false]}

	#消費税込みにする
	def syouhizei(price)
		@price = price * 1.08
		@price.round
	end

	#商品名で検索
	def self.search(search, customer_or_product)
  		if customer_or_product == "2"
     		self.where(['name LIKE ?', "%#{search}%"])
  		else
     		self.all
  		end
	end

end
