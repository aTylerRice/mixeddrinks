class Ingredients < ActiveRecord::Base
  attr_accessible :amount, :name
  belongs_to :drink
end
