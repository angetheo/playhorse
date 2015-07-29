# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 3.times do
#   Carousel.create({
#       image: 'http://lorempixel.com/1920/500',
#       title: Faker::Commerce.product_name,
#       subtitle: Faker::Company.bs,
#       button: ['SCOPRI', 'ESPLORA', 'VEDI', 'PARTECIPA', 'LEGGI TUTTO', 'ALTRO', 'WOW'].sample,
#       button_url: ['http://127.0.0.1:9393/news','http://127.0.0.1:9393/faq','http://127.0.0.1:9393/about','http://127.0.0.1:9393/asd'].sample
#     })
# end

# 10.times do
#   Article.create({
#     title: Faker::Company.catch_phrase,
#     subtitle: Faker::Company.bs,
#     content: Faker::Lorem.paragraph(10),
#     image: '/assets/placeholders/news'+rand(1..5).to_s+'.png',
#     views: 0
#   })
# end

10.times do
  Faq.create({
    category: ['cavalli','ospitalita','servizi','pagamenti'].sample,
    question: 'qua la domanda',
    answer: 'qua la risposta',
    views: 0
  })
end