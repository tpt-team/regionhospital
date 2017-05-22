class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  default_scope { order(created_at: :desc) }
  validates :title, presence: true,
                    length: { minimum: 5 }

  before_create :save_photo

  private

  def save_photo
    self.photo = GoogleCustomSearchApi
                 .search('Medical', searchType: 'image').items.sample.link
  end
end
