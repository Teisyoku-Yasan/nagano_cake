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

end
