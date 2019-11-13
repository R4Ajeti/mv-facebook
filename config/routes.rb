# frozen_string_literal: true

# https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'friendships/new'
  get 'friendships/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
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
  get '/posts/:id/likes/new', to: 'likes#create', as: :like
  # resources :users

  # comments
  get '/posts/:id/comments/new', to: 'comments#new'
  post '/posts/:id/comments/create', to: 'comments#create', as: :comment
  # resources :users

  # friendships
  get '/friendships', to: 'friendships#index'
  get '/friendships/:id', to: 'friendships#create'
end
