class ReviewsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :delete]
	before_filter :ensure_owner, only: [:delete]

	def create
		@my_product = Product.find_by(id: params[:product_id])
		@bids = @my_product.bids
		@reviews = @my_product.reviews
		@my_product.reviews.new(description: params[:review][:description], user: current_user)
		@my_product.save
		render "products/details"
	end

	def delete
		@review.destroy
		@bids = @my_product.bids
		@reviews = @my_product.reviews	

		render "products/details"	
	end

	private

	def ensure_owner
		@my_product = Product.find_by(id: params[:product_id])
		@review = @my_product.reviews.find_by(id: params[:id])

		unless current_user.id == @review.user_id
			flash[:notice] = 'You are not allowed to delete this review!'
			redirect_to products_details_path(@my_product)
			return false
		end
	end
end
