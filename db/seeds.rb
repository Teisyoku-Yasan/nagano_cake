# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
 	email: 'test@test.com',
 	password: 'testtest'
 	)

Genre.create!(
	[{ name: 'ケーキ'},{ name: 'クッキー・焼き菓子'},{ name: 'チョコレート'}])

10.times do |i|
	Product.create!(
		name: "いちごケーキ#{i+1}",
		introduction: 'おいしいいちごケーキです！',
		genre_id: Genre.find(1).id,
		price: 500,
		is_active: 'true'
	)
end

12.times do |i|
	Product.create!(
		name: "チョコクッキー#{i+1}",
		introduction: 'サクサクのチョコクッキーです',
		genre_id: Genre.find(2).id,
		price: 300,
		is_active: 'true'
		)
end

15.times do |i|
	Customer.create!(
		last_name_kana: "ヤマダ#{i+1}",
		first_name_kana: "タロウ#{i+1}",
		last_name: "山田#{i+1}",
		first_name: "太郎#{i+1}",
		postal_code: "111-111#{i+1}",
		street_address: "東京都渋谷区渋谷1-1-#{i+1}",
		phone_num: "090-1111-111#{i+1}",
		email: "test@test#{i+1}.com",
		password: "testtest"
		)
end

5.times do |i|
	Shipping.create!(
		postal_code: "131-8634",
		street_address: "東京都墨田区押上1-1-#{i+1}",
		name: "木村はなこ#{i+1}",
		customer_id: Customer.find(i+1).id
		)
end

5.times do |i|
	Order.create!(
		postal_code: "#{i+1}11-1111",
		street_address: "神奈川県横浜市中区1-1-#{i+1}",
		name: "田中なおき#{i+1}",
		total_price: 1880,
		freight: 800,
		customer_id: Customer.find(i+1).id)
end

4.times do |i|
	OrderDetail.create!(
		quantity: 2,
		price: 1080,
		product_id: Product.find(1).id,
		order_id: Order.find(i+1).id
		)
end

