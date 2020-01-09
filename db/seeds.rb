require 'open-uri'

# ---destroy everything---
puts 'Destroying all the data...'
User.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all


# create users with cocktails & favorites
# cocktails have doses that have ingredients
puts 'Starting creating stuff...'
sleep(1)


# ---Creating Users---
puts 'Starting to create users...'

names = %w[phil haley alex claire luke]
avatars = { phil: 'https://www.tvovermind.com/wp-content/uploads/2017/06/phil-dunphy-modern-family-quote-halloween-epidose-divorce-claire.png',
            haley: 'https://entertainment.unitymedia.de/wp-content/uploads/2019/03/Modern-Family-Sarah-Hyland-696x464.jpg',
            alex: 'https://entertainment.unitymedia.de/wp-content/uploads/2019/03/Modern-Family-Ariel-Winter-696x464.jpg',
            claire: 'https://entertainment.unitymedia.de/wp-content/uploads/2019/03/Modern-Family-Julie-Bowen-696x464.jpg',
            luke: 'https://entertainment.unitymedia.de/wp-content/uploads/2019/03/Modern-Family-Nolan-Gould-696x464.jpg' }

names.each do |name|
  user = User.new
  user.email = "#{name}@gmail.com"
  user.password = '123456'
  user.save

  file = URI.open(name.to_sym)
  user.avatar.attach(io: file, filename: "#{name}.png", content_type: 'image/png')
end
puts "#{User.count} Users created!"
sleep(1)

# ---Creating Ingredients---
puts 'Starting to create ingredients...'

rum = Ingredient.create(name: 'rum')
soda = Ingredient.create(name: 'soda')
lime = Ingredient.create(name: 'lime')
crushed_ice = Ingredient.create(name: 'curshed ice')
brown_sugar = Ingredient.create(name: 'brown sugar')
fresh_mint_leaves = Ingredient.create(name: 'fresh mint leaves')

puts "#{Ingredient.count} ingredients were created!"
sleep(1)

# ---Creating Cocktails & doses---
puts 'Starting to create cocktails & doses...'
TYPES = %w[cl piece tsp tbs leaves]

# Mojito
mojito = Cocktail.create(name: 'mojito', user: User.all.sample)
Dose.create(amount: 5, unit: 'cl', cocktail: mojito, ingredient: rum, description: 'white, e.g. Barcadi or Havana Club')
Dose.create(amount: 6, unit: 'cl', cocktail: mojito, ingredient: soda, description: 'to fill up')
Dose.create(amount: 1, unit: 'piece', cocktail: mojito, ingredient: lime, description: 'quartered or cut in rings')
Dose.create(amount: 4, unit: 'tbs', cocktail: mojito, ingredient: crushed_ice)
Dose.create(amount: 2, unit: 'tsp', cocktail: mojito, ingredient: brown_sugar)
Dose.create(amount: 8, unit: 'leaves', cocktail: mojito, ingredient: fresh_mint_leaves)

mojito.images.attach(io: File.open('../app/assets/images/mojito1.png'), filename: 'mojito1.png', content_type: 'image/jpg')

mojito.images.attach(io: File.open('../app/assets/images/mojito2.png'), filename: 'mojito2.png', content_type: 'image/png')

# Gin Tonic

# Aperol Spritz

# Caipirinha

# London Mule

# Whiskey Sour

# Old Style

# Gluehwein

# Feuerzagen Bowle

# Moskow Mule

puts "#{Cocktail.count} cocktails with #{Dose.count} doses created..."
sleep(1)

# Crating favorites for users
puts 'Adding some favorite cocktails to some users...'
puts "#{Favorite.count} favorite cocktails were sipped!"
sleep(1)

puts "All done, #{User.count} users were creative and created #{Cocktail.count} cocktails of which #{Favorite.count} favorites were already mixed!"
