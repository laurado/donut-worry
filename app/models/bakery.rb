class Bakery < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def self.search(search)
  where("name ILIKE ? OR city ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
