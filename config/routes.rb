Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
  resources :reviews
  resources :spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
