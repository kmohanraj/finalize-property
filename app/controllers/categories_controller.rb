class CategoriesController < ApplicationController
  
  before_action :new_category
  
  def index
  	# @category = Category.all
    categories = Category.all if params[:page].nil?
    @categories = categories.page(params[:page])
    # @categories = categories.page(params[:page]).per_page(5)
  end

  def show
    @category = Category.find_by(id: params[:id])
  end

  # def create
  # 	@category = Category.new(category_params)
  # 	respond_to do |format|
  # 	  if @category.save
  # 	  	format.json {render json: @category, status: :ok }
  # 	  	format.js 
  # 	  	format.html {redirect_to admin_categories_path, flash: {success: "Category Saved Successfully"}}
  # 	  else
  # 	  	format.json {render json: @category.errors.full_messages, status: :unprocessable_entity}
  # 	  	format.js
  # 	  	format.html {redirect_to admin_categories_path, flash: {error: @category.errors.full_messages }}
  # 	  end
  # 	end
  # end

private

  def category_params
  	params.require(:category).permit(:name, :desc, :is_stock)
  end

  def new_category
  	@category = Category.new
  end

end
