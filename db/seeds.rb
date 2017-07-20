bakery1 = Bakery.create(
  name: "Union Square Donuts",
  address: "20 Bow Street",
  city: "Somerville",
  state: "MA",
  zip: "02143",
  description: "Cult donut-maker offers unique sweet and savory flavors, pastries, and java in modern wood-clad digs",
  img_url: "http://static1.squarespace.com/static/51dacd5be4b0a4195e57886a/t/54622df0e4b0719cb5b6638a/1500293678194/"
)

bakery2 = Bakery.create(
  name: "Something Sweet Without Wheat",
  address: "19 6th Road",
  city: "Woburn",
  state: "MA",
  zip: "01801",
  description: "Snug colorful bakeshop lures locals with its range of homemade, gluten-free, and vegan desserts",
  img_url: "http://3.bp.blogspot.com/-sV8nvQ4Gdp4/TjrLSxQDz3I/AAAAAAAAAA4/CGBF679SyTU/s860/new%2Bblog%2Bpic.jpg"
)

bakery3 = Bakery.create(
  name: "Tatte",
  address: "70 Charles Street",
  city: "Boston",
  state: "MA",
  zip: "02114",
  description: "Cozy spot with a rustic feel serving breakfast, soups, sandwiches, and an array of baked treats",
  img_url: "http://2.bp.blogspot.com/-dfixDnz4xiI/VSGRYjXoHGI/AAAAAAAADCs/v2Q-p3MGqFs/s1600/IMG_0331.jpg"
)

Review.create(
  rating: 5,
  description: "This is the best bakery, trust me. We win sooo many donuts. It's yuge.",
  votes: 1,
  bakery: bakery1
)

Review.create(
  rating: 1,
  description: "This bakery is very low-energy. SAD!",
  votes: 5,
  bakery: bakery1
)

Review.create(
  rating: 2,
  description: "FAKE BAKERY!",
  votes: 1,
  bakery: bakery2
)

Review.create(
  rating: 3,
  description: "Make America Bake Again!",
  votes: 10,
  bakery: bakery3
)
