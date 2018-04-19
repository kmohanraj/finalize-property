class EnquiriesController < ApplicationController
  before_action :set_new_query
  
  def index

  end

  def create
  	@query = Query.new(query_params)

  	p '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  	p @query
  	p '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  	respond_to do |format|
  		if @query.save
  			format.json {render json: @query, status: :ok}
  			format.js {redirect_to root_path }
  			format.html {redirect_to homes_path, flash: {success: "Message Send Successfully"}}
  		else
  			format.json {render json: @query.errors.full_messages, status: :unprocessable_entity}
  			format.js
  			format.html {redirect_to homes_path, flash: {error: @query.errors.full_messages}}
  		end
  	end
  end


  private

  def set_new_query
  	@query = Query.new 
  end

  def query_params
  	params.require(:query).permit(:name,:phone,:locality,:user_id,:purpose)
  end
end
