require 'open-uri'

# ---destroy everything---
puts 'Destroying all the data...'
User.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all
Favorite.destroy_all
Dose.destroy_all


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

names.each do |user_name|
  user = User.new
  user.email = "#{user_name}@gmail.com"
  user.password = '123456'
  user.save

  file = URI.open(avatars[user_name.to_sym])
  user.avatar.attach(io: file, filename: "#{user_name}.png", content_type: 'image/png')
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
gin = Ingredient.create(name: 'gin')
tonic = Ingredient.create(name: 'tonic water')
cucumber = Ingredient.create(name: 'cucumber')
ice_cubes = Ingredient.create(name: 'ice cubes')
orange = Ingredient.create(name: 'orange')
aperol = Ingredient.create(name: 'aperol')
prosecco = Ingredient.create(name: 'prosecco')
cachaca = Ingredient.create(name: 'cachaca / pitù')
ginger_beer = Ingredient.create(name: 'ginger beer')
whiskey = Ingredient.create(name: 'whiskey')
sugar_cane_syrup = Ingredient.create(name: 'sugar cane syrup')
lime_juice = Ingredient.create(name: 'lime juice')
angostura = Ingredient.create(name: 'angostura bitters')
wine = Ingredient.create(name: 'red wine')
cinnamon_sticks = Ingredient.create(name: 'cinnamon sticks')
cloves = Ingredient.create(name: 'cloves')
sternarnis = Ingredient.create(name: 'sternarnis')
honey = Ingredient.create(name: 'honey')
orange_juice = Ingredient.create(name: 'orange juice')
zuckerhut = Ingredient.create(name: 'zuckerhut')
vodka = Ingredient.create(name: 'vodka')
lemon = Ingredient.create(name: 'lemon')

puts "#{Ingredient.count} ingredients were created!"
sleep(1)

# ---Creating Cocktails & doses---
puts 'Starting to create cocktails & doses...'

# Mojito
mojito = Cocktail.create(name: 'mojito', user: User.all.sample)
Dose.create(amount: 5, unit: 'cl', cocktail: mojito, ingredient: rum, description: 'white, e.g. Barcadi or Havana Club')
Dose.create(amount: 6, unit: 'cl', cocktail: mojito, ingredient: soda, description: 'to fill up')
Dose.create(amount: 1, unit: 'piece', cocktail: mojito, ingredient: lime, description: 'quartered or cut in rings')
Dose.create(amount: 4, unit: 'tbs', cocktail: mojito, ingredient: crushed_ice)
Dose.create(amount: 2, unit: 'tsp', cocktail: mojito, ingredient: brown_sugar)
Dose.create(amount: 8, unit: 'leaves', cocktail: mojito, ingredient: fresh_mint_leaves)

mojito.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584175/mojito1_hyrbje.jpg'), filename: 'mojito1.png', content_type: 'image/jpg')

mojito.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584176/mojito2_t1eqht.jpg'), filename: 'mojito2.png', content_type: 'image/png')

# Gin Tonic
gin_tonic = Cocktail.create(name: 'gin tonic', user: User.all.sample)
Dose.create(amount: 4, unit: 'cl', cocktail: gin_tonic, ingredient: gin, description: '')
Dose.create(amount: 0, unit: 'fill', cocktail: gin_tonic, ingredient: tonic, description: '')
Dose.create(amount: 2, unit: 'slice', cocktail: gin_tonic, ingredient: cucumber, description: '')
Dose.create(amount: 0, unit: 'none', cocktail: gin_tonic, ingredient: ice_cubes, description: '')

gin_tonic.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584175/gin1_wuevcj.jpg'), filename: 'gin1.png', content_type: 'image/png')

gin_tonic.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584175/gin2_gj8bka.jpg'), filename: 'gin2.png', content_type: 'image/png')

# Aperol Spritz
aperol_spritz = Cocktail.create(name: 'aperol spritz', user: User.all.sample)
Dose.create(amount: 1, unit: 'slice', cocktail: aperol_spritz, ingredient: orange, description: '')
Dose.create(amount: 1, unit: 'tbs', cocktail: aperol_spritz, ingredient: soda, description: '')
Dose.create(amount: 40, unit: 'ml', cocktail: aperol_spritz, ingredient: aperol, description: '')
Dose.create(amount: 80, unit: 'ml', cocktail: aperol_spritz, ingredient: prosecco, description: '')
Dose.create(amount: 0, unit: 'none', cocktail: aperol_spritz, ingredient: ice_cubes, description: '')

aperol_spritz.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584175/aperol1_ylgtrz.jpg'), filename: 'aperol1.png', content_type: 'image/png')

aperol_spritz.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584175/aperol2_vv6rly.jpg'), filename: 'aperol2.png', content_type: 'image/png')

# Caipirinha
caipirinha = Cocktail.create(name: 'caipirinha', user: User.all.sample)
Dose.create(amount: 6, unit: 'cl', cocktail: caipirinha, ingredient: cachaca, description: '')
Dose.create(amount: 1, unit: 'piece', cocktail: caipirinha, ingredient: lime, description: 'slice into cubes and squeze them within the glas')
Dose.create(amount: 2, unit: 'tbs', cocktail: caipirinha, ingredient: brown_sugar, description: '')
Dose.create(amount: 5, unit: 'tbs', cocktail: caipirinha, ingredient: crushed_ice, description: '')

caipirinha.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584174/caipi1_bwjwck.jpg'), filename: 'caipi1.png', content_type: 'image/png')

caipirinha.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584175/caipi2_vpletu.jpg'), filename: 'caipi2.png', content_type: 'image/png')

# London Mule
london_mule = Cocktail.create(name: 'london_mule', user: User.all.sample)
Dose.create(amount: 0.5, unit: 'piece', cocktail: london_mule, ingredient: lime, description: 'juice')
Dose.create(amount: 6, unit: 'cl', cocktail: london_mule, ingredient: gin, description: '')
Dose.create(amount: 9, unit: 'cl', cocktail: london_mule, ingredient: ginger_beer, description: '')

london_mule.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584176/london1_kt831x.jpg'), filename: 'london1.png', content_type: 'image/png')

# Whiskey Sour
whiskey_sour = Cocktail.create(name: 'whiskey sour', user: User.all.sample)
Dose.create(amount: 5, unit: 'cl', cocktail: whiskey_sour, ingredient: whiskey, description: '')
Dose.create(amount: 2, unit: 'cl', cocktail: whiskey_sour, ingredient: sugar_cane_syrup, description: '')
Dose.create(amount: 2, unit: 'cl', cocktail: whiskey_sour, ingredient: lime_juice, description: '')

whiskey_sour.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584177/whiskey_sour1_aisj5c.jpg'), filename: 'whiskey_sour1.png', content_type: 'image/png')

# Old Fashioned
old_fashioned = Cocktail.create(name: 'old fashioned', user: User.all.sample)
Dose.create(amount: 6, unit: 'cl', cocktail: old_fashioned, ingredient: whiskey, description: '')
Dose.create(amount: 0.75, unit: 'cl', cocktail: old_fashioned, ingredient: sugar_cane_syrup, description: '')
Dose.create(amount: 3, unit: 'dashes', cocktail: old_fashioned, ingredient: angostura, description: '')
Dose.create(amount: 1, unit: 'piece', cocktail: old_fashioned, ingredient: lemon, description: 'peel')

old_fashioned.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584176/old1_thvjts.jpg'), filename: 'old1.png', content_type: 'image/png')

# Feuerzangenbowle
feuerzangenbowle = Cocktail.create(name: 'feuerzangenbowle (6 persons)', user: User.all.sample)
Dose.create(amount: 1, unit: 'piece', cocktail: feuerzangenbowle, ingredient: orange, description: 'slice it and put it into the bowle')
Dose.create(amount: 2, unit: 'l', cocktail: feuerzangenbowle, ingredient: wine, description: '')
Dose.create(amount: 500, unit: 'ml', cocktail: feuerzangenbowle, ingredient: orange_juice, description: '')
Dose.create(amount: 1, unit: 'piece', cocktail: feuerzangenbowle, ingredient: cinnamon_sticks, description: '')
Dose.create(amount: 6, unit: 'piece', cocktail: feuerzangenbowle, ingredient: cloves, description: '')
Dose.create(amount: 350, unit: 'ml', cocktail: feuerzangenbowle, ingredient: rum, description: '')
Dose.create(amount: 4, unit: 'piece', cocktail: feuerzangenbowle, ingredient: sternarnis, description: '')
Dose.create(amount: 1, unit: 'piece', cocktail: feuerzangenbowle, ingredient: zuckerhut, description: '')

feuerzangenbowle.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584174/feuerzangenbowle1_nhc2xk.jpg'), filename: 'feuerzangenbowle1.png', content_type: 'image/png')

# Gluehwein
gluehwein = Cocktail.create(name: 'gluehwein', user: User.all.sample)
Dose.create(amount: 1, unit: 'bottle', cocktail: gluehwein, ingredient: wine, description: 'dry wine is better')
Dose.create(amount: 1, unit: 'piece', cocktail: gluehwein, ingredient: orange, description: '')
Dose.create(amount: 2, unit: 'tbs', cocktail: gluehwein, ingredient: brown_sugar, description: '')
Dose.create(amount: 2, unit: 'piece', cocktail: gluehwein, ingredient: cloves, description: 'dt: Nelken')
Dose.create(amount: 4, unit: 'piece', cocktail: gluehwein, ingredient: sternarnis, description: '')
Dose.create(amount: 2, unit: 'piece', cocktail: gluehwein, ingredient: cinnamon_sticks, description: '')
Dose.create(amount: 2, unit: 'tbs', cocktail: gluehwein, ingredient: honey, description: '')

gluehwein.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584176/gluehwein1_zlzzgx.jpg'), filename: 'gluehwein1.png', content_type: 'image/png')

# Moskow Mule
moskow_mule = Cocktail.create(name: 'moskow mule', user: User.all.sample)
Dose.create(amount: 40, unit: 'ml', cocktail: moskow_mule, ingredient: vodka, description: '')
Dose.create(amount: 20, unit: 'ml', cocktail: moskow_mule, ingredient: lime_juice, description: '')
Dose.create(amount: 0, unit: 'fill', cocktail: moskow_mule, ingredient: ginger_beer, description: '')

moskow_mule.photos.attach(io: URI.open('https://res.cloudinary.com/kl3000/image/upload/v1578584176/moskow1_wuohs0.jpg'), filename: 'moskow1.png', content_type: 'image/png')

puts "#{Cocktail.count} cocktails with #{Dose.count} doses created..."
sleep(1)

# Crating favorites for users
puts 'Adding some favorite cocktails to some users...'

User.all.each do |user|
  Favorite.create(user: user, cocktail: Cocktail.all.sample)
end

puts "#{Favorite.count} favorite cocktails were sipped!"
sleep(1)

puts "All done, #{User.count} users were creative and created #{Cocktail.count} cocktails of which #{Favorite.count} favorites were already mixed!"
