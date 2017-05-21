class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 5 }

  before_create :save_photo

  private

  def save_photo
    self.photo = GoogleCustomSearchApi
                 .search('Madical', searchType: 'image').items[rand(9)].link
  end
end
