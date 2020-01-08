class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :tags, array: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
