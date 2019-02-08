Rails.application.routes.draw do
  resources :articles
  resources :roles, only: [:index, :create, :destroy]
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
