class Review < ApplicationRecord
  belongs_to :bakery
  belongs_to :user

  validates :rating,
    presence: true,
    numericality: true,
    inclusion: { in: 1..5, message: 'must be a whole number between 1 and 5' }
end
