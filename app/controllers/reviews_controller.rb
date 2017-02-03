class ReviewsController < ApplicationController
	before_action :find_book
	before_action :find_review, only: [:edit, :update, :destroy]

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

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to books_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to book_path(@book)
	end

	private
		def review_params
			params.require(:review).permit(:rating, :comment,:user_id, :book_id)
		end

		def find_book
			@book = Book.find(params[:book_id])
		end

		def find_review
			@review = @book.reviews.find(params[:id])
		end
end
