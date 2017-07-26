class User < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :reviews
  has_many :bakeries, through: :reviews
  has_many :votes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  # def admin?
  #   role == "admin"
  # end
end
