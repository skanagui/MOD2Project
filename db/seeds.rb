# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Meetup.destroy_all 

User.destroy_all
Location.destroy_all


#20.times do
#   User.create({name: Faker::Name.name, age: Faker::Number.between(from: 1, to: 100)})

seysamger = User.create(name: "Seyi-Sam-Gerard", age: 28, email: "AllOfUs@gmail.com", borough: "Manhattan", phone_number: 1234567890, password: "abc123")
squidsam = User.create(name: "Johnny B Good", age: 32, email: "buddy@gmail.com", borough: "Staten Island", phone_number: 5555555555, password: "abc123")
squidseyi = User.create(name: "Squid Seyi", age: 17, email: "someone@gmail.com", borough: "Bronx", phone_number: 8001357999, password: "abc123")
squidg = User.create(name: "Squid G", age: 21, email: "squadgoals@hotmail.com", borough: "Queens", phone_number: 9876543210, password: "abc123")

####  Users


# locations =
# [

# ""

# ]
choose_your_own = Location.create(name: "TYPE IN YOUR LOCATION", address: "EXPECTED FROM USER", description: "EXPECTED FROM USER")

penn = Location.create(name: "Penn Station", address: "New York, NY", description: "Center of the universe.")
msg = Location.create(name: "Madison Square Garden", address: "4 Pennsylvania Plaza, New York, NY 10001", description: "Where the NY Knicks and Rangers play.")
bronx = Location.create(name: "Bronx", address: "53 Terrace Way, New York, NY 10034", description: "Sam's Hood")
botanical_gardens = Location.create(name: "NYC Botanical Gardens", address: "2900 Southern Blvd, The Bronx, NY 10458", description: "The New York Botanical Garden is a living museum, an educational institution, and a plant research and conservation organization")

####  Locations


# 15.times do
    
meet1 = Meetup.create(purpose: "to chill", time: 12, user_id: User.first.id, location_id: Location.first.id)
meet2 = Meetup.create(purpose: "coffee", time: 11, user_id: User.second.id, location_id: Location.second.id)
meet3 = Meetup.create(purpose: "jog", time: 11, user_id: User.third.id, location_id: Location.third.id)
    
# end

####  MeetUps


blog1 = Blog.create(title: "NYC", body: "sj;dlfjasldjflksajdflkjasd;fjlasjdflkasjdflk", date: "Dec 5, 1989", likes: 1, user_id: User.first.id)

# (2..10).to_a.sample.times do 
#     Blog.create({
#       title: Faker::Hipster.sentence(3),
#       body: Faker::Hipster.paragraphs(4),
#       date: Faker::Date.between(from: '2000-01-23', to: '2020-9-25'), 
#       likes: rand(0..5)
#       }) 
#     end

### Blog
