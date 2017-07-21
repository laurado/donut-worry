Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'
  resources :users

  resources :bakeries, only: [:index, :show, :new, :create]

  namespace :api do
    namespace :v1 do

      resources :bakeries, only: [:index]

      resources :bakeries, only: [:show] do
        resources :reviews, only: [:index]
      end

    end
  end
end
