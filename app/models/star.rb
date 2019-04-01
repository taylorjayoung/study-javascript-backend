class Star < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :question, required: false
  belongs_to :collection , required: false

end
