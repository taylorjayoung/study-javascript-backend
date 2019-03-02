class QuestionsCollection < ApplicationRecord
  belongs_to :question
  belongs_to :collection
end
