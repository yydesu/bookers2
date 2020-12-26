Rails.application.routes.draw do

  devise_for :users
  root to: 'home#top'
  get "home/about"
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :create, :show, :edit, :update]
end
