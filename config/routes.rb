Rails.application.routes.draw do
  get 'admin/index'
  get 'rooms/show'
  resources :jobs
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
  resources :enrollments, :only => [:show, :create,:index] do
    resources :messages, :only => [:create]
  end

  resources :admins, :only => [:index]
  resources :tags
end
