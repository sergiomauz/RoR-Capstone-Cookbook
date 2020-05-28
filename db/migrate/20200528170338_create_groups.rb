class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :user_id, null: false
      t.string :name, null: false, limit: 35
      t.string :icon, null: false
      t.datetime :createdAt, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updatedAt, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :groups, :user_id
  end
end
