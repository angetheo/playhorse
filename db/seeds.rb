puts "Starting seeding..."

puts "- Seeding Carousel"
Carousel.destroy_all
3.times do
  Carousel.create({
      image: 'http://lorempixel.com/1920/500',
      title: Faker::Commerce.product_name,
      subtitle: Faker::Company.bs,
      button: ['SCOPRI', 'ESPLORA', 'VEDI', 'PARTECIPA', 'LEGGI TUTTO', 'ALTRO', 'WOW'].sample,
      button_url: ['http://127.0.0.1:9393/news','http://127.0.0.1:9393/faq','http://127.0.0.1:9393/about','http://127.0.0.1:9393/asd'].sample
    })
end

puts "- Seeding Article"
Article.destroy_all
10.times do
  Article.create({
    title: Faker::Company.catch_phrase,
    subtitle: Faker::Company.bs,
    content: Faker::Lorem.paragraph(10),
    image: '/assets/placeholders/news'+rand(1..5).to_s+'.png',
    views: 0
  })
end

puts "- Seeding Faq"
Faq.destroy_all
10.times do
  Faq.create({
    category: ['cavalli','ospitalita','servizi','pagamenti'].sample,
    question: 'qua la domanda',
    answer: 'qua la risposta',
    views: 0
  })
end

puts "- Seeding Service"
Service.destroy_all
6.times do
	Service.create({
		title: Faker::Commerce.product_name,
		description: Faker::Lorem.paragraph(3),
    icon: 'fa-user'
	})
end

puts "- Seeding Event"
Event.destroy_all
10.times do
  Event.create({
    date: rand(2014..2015).to_s+"/"+rand(1..12).to_s+"/"+rand(1..31).to_s,
    name: "Concorso n. "+rand(100..400).to_s,
    program: ["www.something.com", ""].sample,
    hours: ["www.something.com", ""].sample,
    announcement: ["www.something.com", ""].sample,
    result: ["www.something.com", ""].sample
  })
end

puts "- Seeding Horse"
Horse.destroy_all
10.times do
  Horse.create({
    name: Faker::Name.first_name,
    father: Faker::Name.first_name,
    mother: Faker::Name.first_name,
    year_of_birth: rand(2000..2014),
    nation: Faker::Address.country,
    cv_url: 'http://www.something.com',
    category: ['cavallo','pony'].sample,
    description: 'fake description here',
    picture: Faker::Avatar.image('horse'+rand(1..100).to_s, '200x200'),
    video: ''
  })
end

puts "- Seeding Product"
Product.destroy_all
10.times do
  Product.create({
    category: ['van','box','ostacoli','campi'].sample,
    product_type: ['nuovo','usato','noleggio','trasporto'].sample,
    name: Faker::Commerce.product_name,
    description: Faker::Company.bs,
    picture: Faker::Avatar.image('horse'+rand(1..100).to_s, '200x200')
  })
end

puts "- Seeding Staff"
Staff.destroy_all
orders = (1..10).to_a.shuffle
10.times do
  Staff.create({
    name: Faker::Name.name,
    division: ['asd','srl'].sample,
    role: Faker::Name.title,
    order: orders.pop,
    picture: Faker::Avatar.image('staff'+rand(1..100).to_s, '200x200'),
    facebook: ['some facebook url', ''].sample,
    mail: ['email@email.com',''].sample,
    phone: ['123456789',''].sample,
    linkedin: ['linkedin.com/doge',''].sample
  })
end

puts "- Seeding Mare"
Mare.destroy_all
10.times do
  Mare.create({
    name: Faker::Commerce.product_name,
    description: Faker::Company.bs,
    image: 'http://lorempixel.com/200/200'
  })
end

puts "- Seeding Communication"
Communication.create({ 
  content: "La tua comunicazione qui.",
  comm_type: "eventi" 
})

puts "Seeding completed."