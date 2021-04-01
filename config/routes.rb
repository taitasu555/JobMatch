Rails.application.routes.draw do
  resources :enrollments
  resources :jobs
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
  get 'home/index'
end
