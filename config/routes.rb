Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'
  resources :users

  resources :bakeries, only: [:index, :show] do
    resources :reviews, only: [:index, :edit, :destroy]
  end

  namespace :api do
    namespace :v1 do

      resources :bakeries, only: [:index, :edit, :destroy]

      resources :bakeries, only: [:show, :edit, :destroy] do
        resources :reviews, only: [:index, :edit, :destroy]
      end
    end
  end
end
