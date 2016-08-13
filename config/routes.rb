Rails.application.routes.draw do
  devise_for :teams
  root 'events#index'

  resources :joins
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
