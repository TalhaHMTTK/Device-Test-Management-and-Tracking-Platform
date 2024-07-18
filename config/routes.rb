Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :companies
  get "up" => "rails/health#show", as: :rails_health_check

  root "users#index"
end
