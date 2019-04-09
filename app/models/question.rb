class Question < ApplicationRecord
  has_many :questions_categories
  has_many :questions_collections
  has_many :categories, through: :questions_categories, dependent: :destroy
  has_many :collections, through: :questions_collections, dependent: :destroy
  has_many :comments
  has_many :stars
  has_many :starring_users, through: :stars, source: :user

  accepts_nested_attributes_for :questions_collections

  belongs_to :user
end
