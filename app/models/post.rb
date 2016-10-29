class Post < ApplicationRecord
  validates :title, presence: true,
            length: { minimum: 2,
                      maximum: 30
            }
  validates :body,  presence: true,
            length: { minimum: 3,
                      maximum: 200
            }

  before_save -> { self.published_at ||= DateTime.now }

  default_scope -> { order('published_at DESC') }

  belongs_to :author, class_name: 'User'#, foreign_key: 'author_id'
  has_many :comments
end
