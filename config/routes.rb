# frozen_string_literal: true

# https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # root
  root 'posts#index' # Show all events

  # signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions

  # users
  resources :users

  # posts
  get '/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  resources :posts

  # likes
  resources :users

  # comments
  resources :users

  # friends
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
