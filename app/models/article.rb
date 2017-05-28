class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  default_scope { order(created_at: :desc) }
  validates :title, presence: true,
                    length: { minimum: 5 }

  before_create :set_photo

  private

  def set_photo
    self.photo = GoogleCustomSearchApi
                 .search(title, searchType: 'image').items.sample.link
  end
end
