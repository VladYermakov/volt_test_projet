class Comment < ApplicationRecord
  validates :body,  presence: true,
            length: { minimum: 5,
                      maximum: 140
            }

  before_save { self.published_at ||= DateTime.now }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
end
