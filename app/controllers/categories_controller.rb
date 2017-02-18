class CategoriesController < ApplicationController
	before_action :find_category, only: [:edit, :update, :destroy]

  def new
		@category = Category.new
  end

  def create
		@category = Category.new(category_params)
		
		if @category.save
			flash[:notice] = "Category created with success"
			redirect_to new_book_path
		else
			render 'new'
		end
  end

  def edit
  end

  def update
		if @category.update(category_params)
			flash[:notice] = "Category updated with success"
			redirect_to root_path
		else
			render 'edit'
		end
	end

  def destroy
		@categoy.destroy
		flash[:notice] = "Category destroyed"
		redirect_to root_path
  end

	private

	def category_params
		params.require(:category).permit(:name, :id)
	end

	def find_category
		@category = Category.find(params[:id])
	end
end
