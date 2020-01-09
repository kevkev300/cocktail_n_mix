class Cocktail < ApplicationRecord
  has_many_attached :photos

  has_many :favorites, dependent: :destroy
  has_many :doses, dependent: :destroy
  belongs_to :user
end
