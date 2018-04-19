class Property < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates_processing_of :image
  
  

  enum status: [:active, :inactive]
  ENUM_ENTITY = {"active" => 1, "inactive" => 0}

  scope :property, lambda{|property| where("concat(city, bhk, price) like ?", "%#{property}%").presence || all }

  # def self.search(search)
  # 	if search
  # 		where('locality LIKE ?', "%#{search}%")
  #     # Property.where('city ILIKE :query OR bhk ILIKE :query OR price ILIKE :query', query: "%#{query}%")

  # 		# where('city LIKE ? ', "%#{property}%").having("expenses.category = 1")
  # 	else
  # 		all
  # 	end
  # end

  def self.search(search)
    # where("locality LIKE ?", "%#{search}%").having("properties.status = 1")
    where("locality LIKE ?", "%#{search}%")
  end


  private
	
	def image_size_validation
	   errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
	end
end
