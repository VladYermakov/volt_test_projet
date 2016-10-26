require 'uri/mailto'
class User < ApplicationRecord
  validates :nickname, presence: true,
                       length: { minimum: 3 }
  validates :email,    presence: true,
                       format: { with: URI::MailTo::EMAIL_REGEXP },
                       uniqueness: true
  validates :password, length: { minimum: 8 }

  before_save { email.downcase! }

  has_many :posts,    dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'

  has_secure_password
  has_secure_token :auth_token
end
