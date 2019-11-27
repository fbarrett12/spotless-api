Rails.application.routes.draw do
  resources :pick_ups
  resources :couriers
  resources :loads
  resources :reviews
  resources :providers
  resources :users

  post "login", to: "auth#login"
  get "auth", to: "auth#persist"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
