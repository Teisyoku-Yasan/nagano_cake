class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details, dependent: :destroy
	# orderからorder_detailsにも登録できるようにする
	accepts_nested_attributes_for :order_details

	validates :postal_code, presence: true
	validates :street_address, presence: true
	validates :name, presence: true
	validates :total_price, presence: true

end
