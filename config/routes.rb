Rails.application.routes.draw do
  get 'home/about'=>'homes#about'
  root to: 'homes#top'
  get 'search' => "searchs#search"

  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index] do
    get 'following' => 'relationships#following', as: 'following'
    get 'follower' => 'relationships#follower', as: 'follower'
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end
