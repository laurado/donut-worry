Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users

  root 'static_pages#index'
  resources :users

  resources :bakeries, only: [:index, :show] do
    resources :reviews, only: [:index, :edit, :destroy]
  end
=======
  resources :bakeries, only: [:index, :show, :new, :create]
>>>>>>> 44edc91e7ca96da291286632b68a3a20f7c34011

  namespace :api do
    namespace :v1 do

      resources :bakeries, only: [:index, :edit, :destroy]

      resources :bakeries, only: [:show, :edit, :destroy] do
        resources :reviews, only: [:index, :edit, :destroy]
      end
    end
  end

  devise_for :users
  root 'static_pages#index'
end
