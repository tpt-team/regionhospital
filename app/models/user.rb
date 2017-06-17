class User < ApplicationRecord
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :records, through: :card

  has_one :card, dependent: :destroy
  has_one :doctors_profile, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :email, uniqueness: true
  mount_uploader :avatar, AvatarUploader

  after_save :create_doctors_profile, if: :doctor

  scope :patients, -> { where(doctor: false) }
  scope :doctors, -> { where(doctor: true) }

  def name_for_chat
    email.split('@')[0]
  end

  def card?
    card.present?
  end
end
