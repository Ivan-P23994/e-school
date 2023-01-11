# frozen_string_literal: true

Rails.application.routes.draw do
  resources :assets
  resources :categories
  resources :marks
  resources :invoices
  resources :lessons
  resources :courses

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  get 'dashboard/index'

  root to: 'dashboard#index'
end
