ActiveAdmin.register Property do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  # permit_params :name, :desc, :price, :price_sqft, :bhk, :size, :city, :start_date, :end_date, :status, :property_type, :builder_name, :category_id
  permit_params :name, :desc, :price, :price_sqft, :bhk, :size, :city, :locality, :start_date, :end_date, :status, :property_status, :bathroom, :bedroom, :toilet, :property_type, :sales_type, :project_address, :image, :builder_name, :category_id

  	index do 
  		column :name
  		column :category
  		# column :desc
  		column :price
  		# column :price_sqft
  		column :bhk
  		column :size
  		# column :city
  		column :locality
  		# column :start_date
  		# column :end_date
  		column :status
  		# column :property_status
  		# column :bathroom
  		# column :bedroom
  		# column :toilet
  		# column :property_type
  		column :sales_type
  		# column :project_address
  		# column :image
  		column :builder_name
	  	actions

  	end

  	filter :locality
	  filter :name
  	filter :price
  	filter :builder_name


  	form do |pr|
  	  pr.inputs "Admin Details" do
  	    pr.input :name
  	    pr.input :category
  	    pr.input :desc
  	    pr.input :price
  	    pr.input :price_sqft
  	    pr.input :bhk
  	    pr.input :size
  	    pr.input :city
  	    pr.input :locality
  	    pr.input :start_date
  	    pr.input :end_date
  	    pr.input :status, as: :select 
  	    pr.input :property_status
  	    pr.input :bathroom
  	    pr.input :bedroom
  	    pr.input :toilet
  	    pr.input :property_type
  	    pr.input :sales_type
  	    pr.input :project_address
  	    pr.input :image
  	    pr.input :builder_name
  	end
  	pr.submit
  end


end
