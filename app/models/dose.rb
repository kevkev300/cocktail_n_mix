class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :amount, presence: true, allow_blank: false
  validates :unit, presence: true, allow_blank: false
  validates :ingredient, presence: true, allow_blank: false, uniqueness: { scope: :cocktail }
end
