class AddRelationshipsToStore < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :store, foreign_key: true
  end
end
