class User < ApplicationRecord
  has_secure_password

  has_many :questions
  has_many :collections
  has_many :comments
  has_many :stars
  has_many :starred_collections, through: :stars, dependent: :destroy, source: :collection
  has_many :starred_questions, through: :stars, dependent: :destroy, source: :question

  validates :name, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true

  validates_uniqueness_of :email

end
