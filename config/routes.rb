Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :companies
  resources :customers
  resources :users

  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end

  resources :locations
  resources :devices
  resources :tests
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    resources :tests
  end
  root "home#index"
end
