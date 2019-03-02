class CreateQuestionsCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_collections do |t|
      t.references :question, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
