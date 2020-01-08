class Favorite < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
end
