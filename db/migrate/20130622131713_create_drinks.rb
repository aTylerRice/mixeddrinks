class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :directions
      t.string :category

      t.timestamps
    end
  end
end
