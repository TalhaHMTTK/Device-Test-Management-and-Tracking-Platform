Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :companies
  resources :customers
  resources :users
  resources :locations
  resources :devices
  resources :tests
  get "up" => "rails/health#show", as: :rails_health_check

  root "users#index"
end
