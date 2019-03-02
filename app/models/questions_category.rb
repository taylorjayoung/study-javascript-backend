class QuestionsCategory < ApplicationRecord
  belongs_to :question
  belongs_to :category
end
