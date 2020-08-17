class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details, dependent: :destroy

	validates :postal_code, presence: true
	validates :street_address, presence: true
	validates :name, presence: true
  	validates :total_price, presence: true
end
