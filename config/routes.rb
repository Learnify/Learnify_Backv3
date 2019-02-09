Rails.application.routes.draw do
  resources :articles
  resources :careers
  resources :subjects
  resources :roles, only: [:index, :create, :destroy]
  post 'authenticate', to: 'authentication#authenticate'
  post 'users', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
