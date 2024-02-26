# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

Admin.create!(
   email: 'test@test.com',
   password: '000000'
)
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#ユーザーのテストデータ3人
customer1 = Customer.find_or_create_by!(email: "tarou@example.com") do |customer|
   customer.last_name = "太郎"
   customer.first_name = "テスト"
   customer.address = "東京"
   customer.password = "password"
   customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpeg"), filename:"sample-user1.jpeg")
end

customer2 = Customer.find_or_create_by!(email: "zirou@example.com") do |customer|
   customer.last_name = "二郎"
   customer.first_name = "テスト"
   customer.address = "大阪"
   customer.password = "password"
   customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpeg"), filename:"sample-user2.jpeg")
end

customer3 = Customer.find_or_create_by!(email: "saburou@example.com") do |customer|
   customer.last_name = "三郎"
   customer.first_name = "テスト"
   customer.address = "神奈川"
   customer.password = "password"
   customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpeg"), filename:"sample-user3.jpeg")
end

#品目を分ける為のジャンルのテストデータ3つ
genre_a = Genre.find_or_create_by!(name: "塩")

genre_b = Genre.find_or_create_by!(name: "タレ")

genre_c = Genre.find_or_create_by!(name: "デザート")

#品目のテストデータ3つ
Yakitori.find_or_create_by!(name: "なんこつ") do |yakitori|
  yakitori.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-yakitori1.jpeg"), filename:"sample-yakitori1.jpeg")
  yakitori.introduction = "コリコリして美味しい"
  yakitori.genre = genre_a
end

Yakitori.find_or_create_by!(name: "アイスクリーム") do |yakitori|
  yakitori.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-yakitori2.jpeg"), filename:"sample-yakitori2.jpeg")
  yakitori.introduction = "甘くて美味しい"
  yakitori.genre = genre_c
end

Yakitori.find_or_create_by!(name: "つくね") do |yakitori|
  yakitori.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-yakitori3.jpeg"), filename:"sample-yakitori3.jpeg")
  yakitori.introduction = "タレが美味い"
  yakitori.genre = genre_b
end
