# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 35
      t.string :username, null: false, limit: 15
      t.string :gravatar_url

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
