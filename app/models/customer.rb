class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shippings, dependent: :destroy
  

  # 会員バリデーション
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :postal_code, presence: true
  validates :street_address, presence: true
  validates :phone_num, presence: true

  #会員名で検索
  def self.search(search, customer_or_product)
    if customer_or_product == "1"
      self.where(['last_name LIKE ? OR first_name LIKE ?',"%#{search}%", "%#{search}%"])
    else
       self.all
    end
  end
end
