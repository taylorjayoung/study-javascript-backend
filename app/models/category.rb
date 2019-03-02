class Category < ApplicationRecord
  has_many :questions_categories
  has_many  :questions, through: :questions_categories
end
