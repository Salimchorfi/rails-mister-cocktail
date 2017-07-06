class Dose < ApplicationRecord
  validates :description, presence: true
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail, uniqueness: { scope: :ingredient,
    message: "Has to be unique" }
  validates :ingredient, uniqueness: { scope: :cocktail,
    message: "Has to be unique" }
end
