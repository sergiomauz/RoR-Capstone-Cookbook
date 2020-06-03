class AddAssociations < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :user_id
    add_reference :groups, :user, foreign_key: true    

    add_foreign_key :ingredients, :users, column: :author_id
    add_index :ingredients, :author_id
    
    add_reference :ingredients, :group, foreign_key: true    
  end
end
