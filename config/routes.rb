Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'dashboard/index'

  devise_for :users

  root to: "dashboard#index"

end
