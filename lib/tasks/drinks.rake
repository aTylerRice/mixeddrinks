desc "Fetch Drink info"
task :fetch_drinks => :environment do
	require 'nokogiri'
	require 'open-uri'
	url = "http://www.drinksmixer.com/cat/-/"

	page = Nokogiri::HTML(open(url))
	index = 0
	
	
	puts"1"
	page2 = page.css("div.alf a")
	alfarray = Array.new
	index=0
	for item in page2
		alfarray[index] = "http://www.drinksmixer.com"+item["href"]
		index=index+1
	end
	
	pagesTable=Array.new
	index=0
	puts"2"
	for link in alfarray
		#puts link
		page2 = Nokogiri::HTML(open(link))
		page3 = page2.css("div.fr4 a")
		pagesTable[index]=link
		index=index+1
		for pageUrl in page3
			pagesTable[index]="http://www.drinksmixer.com"+pageUrl["href"]
			index=index+1
		end
	end
	pagesTable = pagesTable.uniq
	drinksTable=Array.new
	index=0
	puts "3"
	for item in pagesTable
		page = Nokogiri::HTML(open(item))
		page2 = page.css("tr a")
		for drinkUrl in page2
			drinksTable[index]="http://drinksmixer.com"+drinkUrl["href"]
			index=index+1
		end
	end

#	for drinkUrl in drinksTable
#		page = Nokogiri::HTML(open(drinkUrl))
#		name = page.css("h1.fn_recipe_title")
#		ingredients = page.css("span.ingredient")
#		directions = page.css("div.RecipeDirections instrustructions")
#		puts name+ingredients+directions
#	end
	puts "4"
	for drinkUrl in drinksTable
		url = Url.new
		url.url = drinkUrl
		url.scraped=0
		url.save
	end
	puts "5"
#	for drinkUrl in drinksTable
#		drink = Drink.new
#		page = Nokogiri::HTML(open(drinkUrl))
#		drink.name = page.css("h1.fn.recipe_title").text
#		drink.category = page.css("div.pm a")[0].text
#		drink.directions = page.css("div.RecipeDirections.instructions").text
#		drink.save
#		for ingredients in page.css("span.ingredient")
#			ingredient = Ingredients.new
#			ingredient.amount = ingredients.css("span.amount").text 
#			ingredient.name = ingredients.css("span.name").text
#			ingredient.drink_id = drink.id
#			ingredient.save
#		end
#	end
end
