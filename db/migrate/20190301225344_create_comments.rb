class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :message
      t.belongs_to :question, index: true

      t.timestamps
    end
  end
end
