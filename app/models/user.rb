class User < ApplicationRecord
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader


  def name
    email.split('@')[0]
  end
end
