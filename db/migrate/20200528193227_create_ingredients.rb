class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :authorid, null: false
      t.string :name, null: false, limit: 35
      t.decimal :amount, null: false, :precision => 6, :scale => 2      
      t.datetime :createdat, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updatedat, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
