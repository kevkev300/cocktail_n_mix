require "open-uri"

# ---destroy everything---
puts "Destroying all the data..."


# create users with cocktails & favorites
# cocktails have doses that have ingredients
puts "Starting creating stuff..."
sleep(1)


# ---Creating Users---
puts "Starting to create users..."

names = ["phill", "haley", "alex", "claire", "luke"]
names.each do |name|
  user = User.new
  user.email = "#{name}@gmail.com"
  user.password = "123456"
  user.save

  # file = URI.open('https://source.unsplash.com/100x100/?people')
  # user.avatar.attach(io: file, filename: "#{name}.png", content_type: 'image/png')
end

puts "#{User.count} Users created!"
sleep(1)

# ---Creating Ingredients---
puts "Starting to create ingredients..."

rum = Ingredient.create(name: "rum")
soda = Ingredient.create(name: "soda")
lime = Ingredient.create(name: "lime")
crushed_ice = Ingredient.create(name: "curshed ice")
brown_sugar = Ingredient.create(name: "brown sugar")
fresh_mint_leaves = Ingredient.create(name: "fresh mint leaves")

puts "#{Ingredient.count} ingredients were created!"
sleep(1)

# ---Creating Cocktails & doses---
puts "Starting to create cocktails & doses..."
TYPES = %w(cl piece tsp tbs leaves)

# Mojito
mojito = Cocktail.create(name: "mojito", user: User.all.sample)
Dose.create(amount: 5, type: "cl", cocktail: mojito, ingredient: rum, description: "white, e.g. Barcadi or Havana Club")
Dose.create(amount: 6, type: "cl", cocktail: mojito, ingredient: soda, description: "to fill up")
Dose.create(amount: 1, type: "piece", cocktail: mojito, ingredient: lime, description: "quartered or cut in rings")
Dose.create(amount: 4, type: "tbs", cocktail: mojito, ingredient: crushed_ice)
Dose.create(amount: 2, type: "tsp", cocktail: mojito, ingredient: brown_sugar)
Dose.create(amount: 8, type: "leaves", cocktail: mojito, ingredient: fresh_mint_leaves)

mojito.images.attach(io: File.open("../app/assets/images/mojito1.png"), filename: "mojito1.png", content_type: "image/jpg")

mojito.images.attach(io: File.open("../app/assets/images/mojito2.png"), filename: "mojito2.png", content_type: "image/png")

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
puts "Adding some favorite cocktails to some users..."
puts "#{Favorite.count} favorite cocktails were sipped!"
sleep(1)

puts "All done, #{User.count} users were creative and created #{Cocktail.count} cocktails of which #{Favorite.count} favorites were already mixed!"
