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

  namespace :api do
    resources :tests, only: [:index, :show] do
      collection do
        get 'last_month'
        get 'completed_tests'
        get 'between_dates'
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
