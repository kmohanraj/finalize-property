Rails.application.routes.draw do
 

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'about_us/index'

  # get 'enquires/index'

 get 'faqs/index'

 get 'terms/index'

 get 'abouts/index'

 get 'messages/new'

 devise_for :users
 resources :properties
 resources :homes
 resources :messages
 resources :accounts
 resources :abouts
 resources :contacts
 resources :properties
 resources :categories
 resources :enquirey
 resources :enquiries

 
 # namespace :admin do
 # 	resources :categories, only: [:index, :update, :edit, :new, :create], controller: '/admin/categories', action:'new' 
 # 	resources :admins
 # 	resources :properties, only: [:index, :update, :edit, :new]

 # end

 get 'accounts/user'

 root "homes#index"
end
