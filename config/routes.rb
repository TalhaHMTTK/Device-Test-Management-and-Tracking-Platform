Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :companies
  resources :customers
  resources :users

  namespace :super_admin do
    get 'all_users', to: 'users#all_users'
  end

  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end

  resources :locations
  resources :devices
  resources :tests
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
