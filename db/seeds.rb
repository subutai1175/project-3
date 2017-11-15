# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Interaction.destroy_all
Photo.destroy_all
Brand.destroy_all
User.destroy_all

10.times do
  User.create(
    name: Faker::WorldOfWarcraft.hero,
    email: Faker::Internet.email,
    password: 'test123'
  )
end

1.times do
  Brand.create(
    name: Faker::Pokemon.name,
    logo: 'Adidas',
    link: 'http://shop.adidas.com.sg/'
  )
end

photo_array = [
  'jpeg_oj5lqy.jpg', '2ee24f990d394ab4762900b9a66e5c6c--adidas-mens-clothing-adidas-outfits-men_wjkqcn.jpg',
  'Kendall_Jenner_Celebrity_Social_Media_Pics_39cT5k6XvhNl_cljozs.jpg',
  'gallery_1_1_raatmi.jpg',
  'emily-ratajkowski-pics-celebrity-social-media-2-23-2017-1_qtzgt8.jpg',
  '515140-celebrity-endorsement-social-media-fails_gb38zv.png'
]

30.times do
  Photo.create(
    title: Faker::LordOfTheRings.character,
    description: Faker::LordOfTheRings.location,
    photo_link: photo_array.sample,
    user_id: User.all.sample.id,
    brand_id: Brand.all.sample.id,
    points: [*0..100].sample
  )
end

50.times do
  Interaction.create(
    content: Faker::WorldOfWarcraft.quote,
    message_type: [0, 1].sample,
    user_id: User.all.sample.id,
    photo_id: Photo.all.sample.id
  )
end
