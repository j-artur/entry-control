Rails.application.routes.draw do
    resources :visits
    resources :visitors
    resources :units
    resources :sectors
    resources :users

  devise_for :users, :path => "auth"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "visits#index"
end
