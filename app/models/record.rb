class Record < ApplicationRecord
  belongs_to :card, required: false

  delegate :user, to: :card, allow_nil: true

  mount_uploader :image, AvatarUploader
end
