class CategoryController < ApplicationController
	
  # GET /category/:name
  def show
    @drinks = Drink.where("category = ?",params[:name]).order("name").page(params[:page]).per(30)

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
