class Cocktail < ApplicationRecord
  has_many_attached :photos

  has_many :favorites, dependent: :delete_all
  has_many :doses, dependent: :delete_all
  has_many :ingredients, through: :doses
  belongs_to :user, optional: true

  validates :name, presence: true, allow_blank: false, uniqueness: true
end
