class User < ApplicationRecord
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :records, through: :card

  has_one :card, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :email, uniqueness: true
  mount_uploader :avatar, AvatarUploader

  scope :patients, -> { where(doctor: false) }

  def name_for_chat
    email.split('@')[0]
  end

  def card?
    card.present?
  end
end
