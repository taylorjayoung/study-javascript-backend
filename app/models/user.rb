class User < ApplicationRecord
  has_secure_password

  has_many :questions
  has_many :collections
  has_many :comments

  validates :name, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true

end
