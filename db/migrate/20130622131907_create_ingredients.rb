class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :amount
      t.string :name

      t.timestamps
    end
  end
end
