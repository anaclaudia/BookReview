class ReviewsController < ApplicationController
	before_action :find_book

	def new
		@review = @book.reviews.build
	end

	def create
		@review = @book.reviews.create(review_params)

		if @review
			/render json: params/
			redirect_to book_path(@book)
		else
			render 'new'
		end
	end



	private
		def review_params
			params.require(:review).permit(:rating, :comment,:user_id, :book_id)
		end

		def find_book
			@book = Book.find(params[:book_id])
		end
end
