class Sandwich < ActiveRecord::Base
	has_many :sandwich_ingredients
	has_many :ingredients, through: :sandwich_ingredients

	def add(ingredient)
		self.ingredients.push(ingredient)
		self.total_calories += ingredient.calories
		self.save
	end
end
