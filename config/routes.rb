Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, only: [:new, :create, :show]

  resources :gifs, only: [:index]

  namespace :admin do
    resources :categories, only: [:new, :create]
    resources :gifs, only: [:new, :create]
  end
end
