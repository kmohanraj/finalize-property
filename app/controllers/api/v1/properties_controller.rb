class Api::V1::PropertiesController < ApplicationController
  
  before_action :get_property, only: [:create, :index]
  
  def index
    # @properties = Property.all
    properties = Property.all if params[:order].nil?
    @properties = properties.page(params[:page]).per_page(9)
      respond_to do |format|
        format.json {render json: @properties, status: :ok }
        format.js
        format.html
      end
  end

  def create
    begin
      property = Property.create(property_params)
      if property.save
        render :json => {status: "success", :message=> "Product Successfully Created"}, :status => 200
      else
        render :json => {status: "success", :message => property.errors.messages}, :status => 422
      end  
    rescue => e
      render :json => {status: "fail", :message => e.message}, :status => 400
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  # def create
  #   @properties = Property.new(property_params)
  #   respond_to do |format|
  #     if @properties.save
  #       format.json {render json: @properties, status: :ok }
  #       format.js
  #       format.html {redirect_to properties_path, flash: {success: "Property Saved successfully" }}
  #     else
  #       format.json {render json: @properties.errors.full_messages, status: :unprocessable_entity}
  #       format.js
  #       format.html {redirect_to properties_path, flash: {error: @properties.errors.full_messages}}
  #     end
  #   end
  # end

  private

  def property_params
    params.require(:property).permit(:name,:desc,:price,:price_sqft,:bhk,:size,:city,:start_date,:end_date,:status,:property_type,:sales_type,:project_address,:image,:builder_name,:category_id)
  end

  def set_new_property
    @property = Property.new
  end

  def get_property
    @property = Property.find_by_id(params[:id])
  end


end
