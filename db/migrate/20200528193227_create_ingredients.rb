class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|      
      t.bigint :author_id, null: false      
      t.string :name, null: false, limit: 35
      t.decimal :amount, null: false, :precision => 6, :scale => 2      
      t.timestamps
    end
  end
end
