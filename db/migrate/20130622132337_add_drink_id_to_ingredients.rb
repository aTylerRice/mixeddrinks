class AddDrinkIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :drink_id, :integer
  end
end
