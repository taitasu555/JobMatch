Rails.application.routes.draw do
  get 'rooms/show'
  resources :enrollments
  resources :jobs
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
end
