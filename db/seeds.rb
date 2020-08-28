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
	[{ name: 'ケーキ'},{ name: 'クッキー・焼き菓子'},{ name: 'チョコレート'},{ name: 'プリン・ゼリー'}])

Product.create!(
	name: 'ホワイトクリームカップケーキ',
	introduction: 'ホワイトチョコのクリームをたっぷりのせたカップケーキ',
	genre_id: 2,
	price: 500,
	is_active: 'true',
	image: File.open("./app/assets/images/cupcake.jpg")
)

Product.create!(
	name: 'アップルパイ',
	introduction: 'リンゴをつかった手作りパイ',
	genre_id: 1,
	price: 900,
	is_active: 'true',
	image: File.open("./app/assets/images/applepie.jpg")
)

Product.create!(
	name: 'いちごのマカロン',
	introduction: 'いちごをつかったマカロン',
	genre_id: 2,
	price: 800,
	is_active: 'true',
	image: File.open("./app/assets/images/macarons.jpg")
)

Product.create!(
	name: 'クランチチョコレート',
	introduction: 'アーモンドクランチ入りの板チョコ',
	genre_id: 3,
	price: 350,
	is_active: 'true',
	image: File.open("./app/assets/images/armondchoco.jpg")
)


10.times do |i|
	Product.create!(
		name: "フルーツタルト#{i+1}",
		introduction: 'フルーツいっぱいのタルト',
		genre_id: 1,
		price: 1100,
		is_active: 'true',
		image: File.open("./app/assets/images/fruittart.jpg")
	)
end

12.times do |i|
	Product.create!(
		name: "チョコクッキー#{i+1}",
		introduction: 'クリームをサンドしたチョコクッキー',
		genre_id: 2,
		price: 400,
		is_active: 'true',
		image: File.open("./app/assets/images/choco_cookie.jpg")
		)
end

5.times do |i|
	Product.create!(
		name: "ビターチョコ#{i+1}",
		introduction: '苦いチョコ',
		genre_id: 3,
		price: 450,
		is_active: 'true',
		image: File.open("./app/assets/images/chocolate.jpg")
		)
end

5.times do |i|
	Product.create!(
		name: "たまごプリン",
		introduction: 'しっかりとした固いプリン',
		genre_id: 4,
		price: 600,
		is_active: 'true',
		image: File.open("./app/assets/images/pudding.jpg")
		)
end



15.times do |i|
	gimei = Gimei.name
	address = Gimei.address

	Customer.create!(
		last_name_kana: gimei.last.katakana,
		first_name_kana: gimei.first.katakana,
		last_name: gimei.last.kanji,
		first_name: gimei.first.kanji,
		postal_code: "111-111#{i+1}",
		street_address: address.kanji,
		phone_num: "090-1111-111#{i+1}",
		email: "test@test#{i+1}.com",
		password: "testtest"
		)
end

5.times do |i|
	gimei = Gimei.name
	address = Gimei.address

	Shipping.create!(
		postal_code: "131-8634",
		street_address: address.kanji,
		name: gimei.kanji,
		customer_id: Customer.find(i+1).id
		)
end

5.times do |i|
	gimei = Gimei.name
	address = Gimei.address

	Order.create!(
		postal_code: "#{i+1}11-1111",
		street_address: address.kanji,
		name: gimei.kanji,
		total_price: 1880,
		freight: 800,
		customer_id: Customer.find(i+1).id)
end

5.times do |i|
	OrderDetail.create!(
		quantity: 2,
		price: 1080,
		product_id: Product.find(1).id,
		order_id: Order.find(i+1).id
		)
end

