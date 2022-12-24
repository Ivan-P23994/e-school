Rails.application.routes.draw do
  resources :courses
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  get 'dashboard/index'

  root to: "dashboard#index"
end
