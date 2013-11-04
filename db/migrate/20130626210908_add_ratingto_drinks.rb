class AddRatingtoDrinks < ActiveRecord::Migration
    def change
    add_column :drinks, :rating, :integer
    add_column :drinks, :count, :integer
  end
end
