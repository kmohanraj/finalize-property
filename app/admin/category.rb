ActiveAdmin.register Category do
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

	permit_params :name, :desc, :is_stock
	index do
		column :name
		column :desc
		column :is_stock
		actions
	end

	filter :name
	filter :is_stock
	filter :created_at

	form do |c|
		c.inputs "Admin Details" do
			c.input :name
			c.input :desc
			c.input :is_stock
		end
		c.submit
	end
end
