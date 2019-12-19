# frozen_string_literal: true

Rails.application.routes.draw do
  get '/health_check', to: 'lb#health'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  root to: 'posts#top'
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
end
