Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'public#home'
  get '/features', to: 'public#features'
  get '/contact', to: 'public#contact'
  resources :users do
    resources :practices
  end

end
