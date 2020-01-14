class Cocktail < ApplicationRecord
  has_many_attached :photos

  has_many :favorites
  has_many :doses
  has_many :ingredients, through: :doses
  belongs_to :user, optional: true

  validates :name, presence: true, allow_blank: false, uniqueness: true
end
