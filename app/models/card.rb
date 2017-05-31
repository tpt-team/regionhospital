class Card < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  accepts_nested_attributes_for :records
end
