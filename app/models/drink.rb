class Drink < ActiveRecord::Base
  attr_accessible :category, :directions, :name
  has_many :ingredients
end
