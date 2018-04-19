class Admin::AdminsController < ApplicationController

  def index
  	users = User.all if params[:order].nil?
  	@users = User.page(params[:page]).per_page(5)

    categories = Category.all if params[:order].nil?
    @categories = categories.page(params[:page]).per_page(5)


    # properties = Properties.search(params[:property])
    properties = Property.all if params[:order].nil?
    @properties = properties.page(params[:page]).per_page(5)

    #messages
    messages = Message.all if params[:order].nil?
    @messages = messages.page(params[:page]).per_page(5)

  end

end