desc "Fetch Drink info"
task :fetch_drink_info => :environment do
	require 'nokogiri'
	require 'open-uri'
	for drinkUrl in Url.where("scraped = 0")
		drink = Drink.new
		page = Nokogiri::HTML(open(drinkUrl.url))
		drink.name = page.css("h1.fn.recipe_title").text
		drink.category = page.css("div.pm a")[0].text
		drink.directions = page.css("div.RecipeDirections.instructions").text
		drink.rating = page.css("div.ratingsBox div.average").text
		drink.count = page.css("div.ratingsBox div.average").text
		drink.save
		for ingredients in page.css("span.ingredient")
			ingredient = Ingredients.new
			ingredient.amount = ingredients.css("span.amount").text 
			ingredient.name = ingredients.css("span.name").text
			ingredient.drink_id = drink.id
			ingredient.save
		end
		drinkUrl.scraped = true
		drinkUrl.save
	end
	
end
