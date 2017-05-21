class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :medical_cards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  scope :doctors, -> { where(doctor: true) }

  def doctor?
    doctor
  end
end
