class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: :index
	
	def index
		@books = Book.all.order("created_at DESC")
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
		respond_to do |format|
			if @book.update(book_params)
				format.html { redirect_to @book, notice: "Book sucessfuly updated" }
			else
				render 'edit'
			end
		end
	end

	def destroy
		@book.destroy
		redirect_to root_path
	end

		private
		def book_params
			params.require(:book).permit(:title, :description, :user_id, :category_id)
		end

		def find_book
			@book = Book.find(params[:id])
		end
end
