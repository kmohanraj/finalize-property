class PropertiesController < ApplicationController
  
  # before_action :set_new_property
  
  def index
    @search = Property.ransack(params[:q])
    @search.sorts = 'created_at asc' if @search.sorts.empty?
    @search.sorts = 'price asc' if @search.sorts.empty?
    properties = Property.search(params[:search])
    properties = Property.property if params[:search] == "property"
    properties = Property.all if params[:search].nil?
    @properties = properties.page(params[:page]).per_page(6).order("created_at DESC")
      respond_to do |format|
        format.json {render json: @properties, status: :ok }
        format.js
        format.html
      end
  end

  def show
    @property = Property.find(params[:id])
    respond_to do |format|
      format.html
      format.js
      format.json {render json: @property, status: :ok}
    end
  end

  def create
  	@properties = Property.new(property_params)
  	respond_to do |format|
  	  if @properties.save
  	  	format.json {render json: @properties, status: :ok }
  	  	format.js
  	  	format.html {redirect_to properties_path, flash: {success: "Property Saved successfully" }}
  	  else
  	  	format.json {render json: @properties.errors.full_messages, status: :unprocessable_entity}
  	  	format.js
  	  	format.html {redirect_to properties_path, flash: {error: @properties.errors.full_messages}}
  	  end
  	end
  end

  # private

  # def property_params
  # 	params.require(:property).permit(:name,:desc,:price,:price_sqft,:bhk,:size,:city,:start_date,:end_date,:status,:property_status,:bathroom,:bedroom,:toilet,:property_type,:sales_type,:project_address,:image,:builder_name,:category_id)
  # end

  # def set_new_property
  # 	@property = Property.new
  # end


end
