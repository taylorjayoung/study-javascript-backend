class AddUserIdToCollections < ActiveRecord::Migration[5.2]
    def change
      add_column :collections, :user_id, :integer
      add_column :collections, :private, :boolean, null: false, default: false
      add_column :users, :admin, :boolean, null: false, default: false
  end
end
