Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/show'
  get 'friends/new'
  get 'friends/create'
  get 'likes/new'
  get 'likes/create'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'sessions/new'
  get 'sessions/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
