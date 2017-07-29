Rails.application.routes.draw do
  devise_for :users

  resources :meetups do
    resources :comments
  end

    namespace :api do
     namespace :vi do
       resources :users, only: [:index, :create, :show, :update, :destroy]
       resources :sessions, only: [:create]
       resources :meetups, only: [:index]
     end
   end


  root 'meetups#index'
end
