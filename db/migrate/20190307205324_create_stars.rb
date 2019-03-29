class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.references :user, foreign_key: true
      t.references :collection, foreign_key: true
      t.references :question, foreign_key: true

    end
  end
end
