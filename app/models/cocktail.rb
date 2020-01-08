class Cocktail < ApplicationRecord
  has_many :favorites
  has_many :doses
  belongs_to :user
end
