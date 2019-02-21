Rails.application.routes.draw do
  resources :professors
  resources :articles
  resources :tutorials  
  resources :careers
  resources :subjects
  resources :users
  resources :roles, only: [:index, :show, :create, :destroy]
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
