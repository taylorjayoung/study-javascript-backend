class Question < ApplicationRecord
  has_many :questions_categories
  has_many :questions_collections
  has_many :categories, through: :questions_categories
  has_many :collections, through: :questions_collections
  has_many :comments
  belongs_to :user
end
