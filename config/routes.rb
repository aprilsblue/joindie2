Rails.application.routes.draw do

  # root route
  root 'home#index'

  # devise route for team as user
  devise_for :teams

  # resources route for 'join' and 'event'
  resources :joins
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
