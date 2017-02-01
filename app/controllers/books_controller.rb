class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :delete]
	
	def index
		@books = Book.all.order("created_at DESC")
  end

	def show
	end
	
	def new
		@book = Book.new()
	end

	def create
		@book = Book.new(book_params)
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


		private
		def book_params
			params.require(:book).permit(:title, :description, :author_id)
		end

		def find_book
			@book = Book.find(params[:id])
		end
end
