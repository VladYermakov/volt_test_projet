require 'uri/mailto'
class User < ApplicationRecord
  validates :nickname, presence: true,
                       length: { minimum: 3 }
  validates :email,    presence: true,
                       format: { with: URI::MailTo::EMAIL_REGEXP },
                       uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, :if => -> { password_digest.nil?}

  before_save { email.downcase! }

  has_many :posts,    dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'

  has_secure_password
  has_secure_token :auth_token

  has_attached_file :avatar, styles: { medium: '500x500>', preview: '300x300>' }

  validates_attachment :avatar, content_type: { content_type: /\Aimage\/.*\z/i }
  #do_not_validate_attachment_file_type :avatar
end
