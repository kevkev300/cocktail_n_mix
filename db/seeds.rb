require "open-uri"

# destroy everything
puts "Destroying all the data..."


# create users with cocktails & favorites
# cocktails have doses that have ingredients
puts "Starting creating stuff..."
sleep(1)


# Creating Users
puts "Starting to create users..."

names = ["phill", "haley", "alex", "claire", "luke"]
names.each do |name|
  user = User.new
  user.email = "#{name}@gmail.com"
  user.password = "123456"
  user.save

  file = URI.open('https://source.unsplash.com/100x100/?people')
  user.avatar.attacsh(io: file, filename: "#{name}.png", content_type: 'image/png')
end

puts "#{User.count} Users created!"
sleep(1)

# Creating Ingredients
puts "Starting to create ingredients..."
puts "#{Ingredient.count} ingredients were created!"
sleep(1)

# Creating Cocktails & doses
puts "Starting to create cocktails & doses..."
puts "#{Cocktail.count} cocktails with #{Dose.count} doses created..."
sleep(1)

# Crating favorites for users
puts "Adding some favorite cocktails to some users..."
puts "#{Favorite.count} favorite cocktails were sipped!"
sleep(1)

puts "All done, #{User.count} users were creative and created #{Cocktail.count} cocktails of which #{Favorite.count} favorites were already mixed!"
