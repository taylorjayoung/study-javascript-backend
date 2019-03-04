class AddUserIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :user_id, :integer
    add_column :questions, :private, :boolean, null: false, default: false
  end
end
