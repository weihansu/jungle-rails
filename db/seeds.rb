# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

prod1 = cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

prod2 = cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

prod3 = cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

prod4 = cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

prod5 = cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

prod6 = cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


prod7 = cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

prod8 = cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

prod9 = cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

prod10 = cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

prod11 = cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

prod12 = cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

## USERS

puts "Re-creating Users ..."

User.destroy_all

user1 = User.create(
  :first_name => Faker::Name.first_name,
  :last_name => Faker::Name.last_name,
  :email => Faker::Internet.email,
  :password => 'Jungle',
  :password_confirmation => 'Jungle'
)

user2 = User.create(
  :first_name => Faker::Name.first_name,
  :last_name => Faker::Name.last_name,
  :email => Faker::Internet.email,
  :password => 'Jungle',
  :password_confirmation => 'Jungle'
)

user3 = User.create(
  :first_name => Faker::Name.first_name,
  :last_name => Faker::Name.last_name,
  :email => Faker::Internet.email,
  :password => 'Jungle',
  :password_confirmation => 'Jungle'
)

## RATINGS

puts "Re-creating Ratings ..."

Rating.destroy_all

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user1,
  :product => prod1
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user1,
  :product => prod1
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user1,
  :product => prod2
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user1,
  :product => prod2
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod3
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod3
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod4
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod4
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user1,
  :product => prod5
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user3,
  :product => prod5
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user3,
  :product => prod6
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user3,
  :product => prod6
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user3,
  :product => prod7
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user3,
  :product => prod7
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user3,
  :product => prod8
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user3,
  :product => prod8
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod10
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod9
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod9
)

Rating.create(
  :description => Faker::Cannabis.buzzword,
  :rating => rand(0...5),
  :user => user2,
  :product => prod10
)


puts "DONE!"
