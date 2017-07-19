# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bakery1 = Bakery.create(name: "Union Square Donuts", address: "20 Bow Street", city: "Somerville", state: "MA", zip: "02143", description: "Cult donut-maker offers unique sweet and savory flavors, pastries, and java in modern wood-clad digs")

bakery2 = Bakery.create(name: "Something Sweet Without Wheat", address: "19 6th Road", city: "Woburn", state: "MA", zip: "01801", description: "Snug colorful bakeshop lures locals with its range of homemade, gluten-free, and vegan desserts")

bakery3 = Bakery.create(name: "Tatte", address: "70 Charles Street", city: "Boston", state: "MA", zip: "02114", description: "Cozy spot with a rustic feel serving breakfast, soups, sandwiches, and an array of baked treats")

review1 = Review.create(rating: 5, description: "This is the best bakery, trust me. We win sooo many donuts. It's yuge." , votes: 1, bakery: bakery1)

review2 = Review.create(rating: 1, description: "This bakery is very low-energy. SAD!" , votes: 5, bakery: bakery1)

review3 = Review.create(rating: 2, description: "FAKE BAKERY!" , votes: 1, bakery: bakery2)

review4 = Review.create(rating: 3, description: "Make America Bake Again!" , votes: 10, bakery: bakery3)
