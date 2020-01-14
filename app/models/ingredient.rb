class Ingredient < ApplicationRecord
  has_many :doses

  # def ingredient_names(search_string)
  #   ingredient_names = []
  #   ingredients = Ingredient.where(name: "#{search_string}%")
  #   ingredients.each { |ingredient| ingredient_names << ingredient.name}

  #   ingredient_names
  # end
end
