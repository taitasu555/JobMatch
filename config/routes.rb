Rails.application.routes.draw do
  resources :enrollments
  resources :jobs
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
  get 'home/index'
  resources :chat_rooms, only: [:create, :show]
  resources :matching, only: [:index]
  resources :chats
end
