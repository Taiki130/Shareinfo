Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  root to: 'posts#top'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
