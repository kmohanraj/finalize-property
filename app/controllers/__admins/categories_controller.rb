class Admin::CategoriesController < ApplicationController
  
  before_action :new_category
  
  def index
    categories = Category.all if params[:order].nil?
    @categories = categories.page(params[:page]).per_page(5)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
  	@category = Category.new(category_params)
  	respond_to do |format|
  	  if @category.save
  	  	format.json {render json: @category, status: :ok }
  	  	format.js {redirect_to admin_admins_path }
  	  	format.html {redirect_to admin_admins_path, flash: {success: "Category Saved Successfully"}}
  	  else
  	  	format.json {render json: @category.errors.full_messages, status: :unprocessable_entity}
  	  	format.js
  	  	format.html {redirect_to admin_admins_path, flash: {error: @category.errors.full_messages }}
  	  end
  	end
  end

private

  def category_params
  	params.require(:category).permit(:name, :desc, :is_stock)
  end

  def new_category
  	@category = Category.new
  end

end
