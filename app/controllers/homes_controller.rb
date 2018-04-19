class HomesController < ApplicationController
 

  def index
  	@property = Property.order(name: :asc).limit(4)
  end

end
