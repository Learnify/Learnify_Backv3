Rails.application.routes.draw do
  resources :professors
  resources :articles
  resources :tutorials  
  resources :careers
  resources :subjects
  resources :users
  resources :roles, only: [:index, :show, :create, :destroy]
  post '/authenticate', to: 'authentication#authenticate'
  get '/subjectsp/:id', to: 'users#subjects'
  get '/articlesp/:id', to: 'users#articles'
  post '/professorsname', to: 'professors#showbyname'
  post '/subjectsname', to: 'subjects#showbyname'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
