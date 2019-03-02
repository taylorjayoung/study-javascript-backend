class CreateQuestionsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_categories do |t|
      t.references :question, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
