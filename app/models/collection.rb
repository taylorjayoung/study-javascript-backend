class Collection < ApplicationRecord
  has_many :questions_collections
  has_many :questions, through: :questions_collections
  belongs_to :user
  has_many :stars
  has_many :starring_users, through: :stars, source: :user

end
