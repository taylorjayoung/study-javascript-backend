class User < ApplicationRecord
  has_many :questions
  has_many :collections
  has_many :comments


  has_secure_password
end
