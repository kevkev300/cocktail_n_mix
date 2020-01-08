class Cocktail < ApplicationRecord
  has_many :favorites
  belongs_to :user, optional: true
end
