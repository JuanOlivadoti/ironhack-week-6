class SandwichViewsController < ApplicationController
	def index
		@sandwiches = Sandwich.all
	end

	def details
		@sandwich = Sandwich.find_by(id: params[:id])
		return unless @sandwich 
		@ingredients = @sandwich.ingredients
		@avaible_ingredients = Ingredient.all
	end
end
