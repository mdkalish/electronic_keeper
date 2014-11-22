# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |n|
  name  = Faker::Lorem.word
  price = Faker::Commerce.price
  ingredients = Faker::Lorem.sentence(rand(2..7))
  Pizza.create!(name: "#{name}-#{n}", price: price,
                ingredients: ingredients, category: 'pizza')
end
