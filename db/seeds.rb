puts "Starting seeding..."

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

Faq.destroy_all
10.times do
  Faq.create({
    category: ['cavalli','ospitalita','servizi','pagamenti'].sample,
    question: 'qua la domanda',
    answer: 'qua la risposta',
    views: 0
  })
end

Service.destroy_all
6.times do
	Service.create({
		title: Faker::Commerce.product_name,
		description: Faker::Lorem.paragraph(3),
    icon: 'fa-user'
	})
end

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

puts "Seeding completed."