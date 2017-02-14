class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		if params[:category_id].blank?
			@books = Book.order("created_at DESC")
		else
			@category = Category.find(params[:category_id])
			@books = @category.books
		end
  end

	def show
	end
	
	def new
		@book = current_user.books.build
	end

	def create
		@book = current_user.books.build(book_params)
		if @book.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @book.update(book_params)
			redirect_to root_path, notice: "Book sucessfuly updated"
		else
			render 'edit'
		end
	end

	def destroy
		@book.destroy
		redirect_to root_path
	end

		private
		def book_params
			params.require(:book).permit(:title, :description, :user_id, :category_id, :book_img)
		end

		def find_book
			@book = Book.find(params[:id])
		end
end
