class MessagesController < ApplicationController
  before_action :set_new_message
  
  def index

  end

  def create
  	@message = Message.new(message_params)
  	respond_to do |format|
  		if @message.save
  			format.json {render json: @message, status: :ok}
  			format.js {redirect_to root_path } 
  			format.html {redirect_to root_path, flash: {success: "Message Send Successfully"}}
  		else
  			format.json {render json: @message.errors.full_messages, status: :unprocessable_entity}
  			format.js
  			format.html {redirect_to homes_path, flash: {error: @message.errors.full_messages}}
  		end
  	end
  end


  private

  def set_new_message
  	@message = Message.new 
  end

  def message_params
  	params.require(:message).permit(:name,:email,:phone,:locality,:price_range,:desc,:user_id)
  end 

end
