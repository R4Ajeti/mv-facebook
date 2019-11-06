# frozen_string_literal: true

# https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users
  # root
  root 'posts#index' # Show all events

  # users
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'

  # posts
  get '/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  resources :posts

  # likes
  # resources :users

  # comments
  # resources :users

  # friends
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
