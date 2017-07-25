Rails.application.routes.draw do
  resources :bakeries, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  namespace :api do
    namespace :v1 do

      resources :bakeries, only: [:index]

      resources :bakeries, only: [:show] do
        resources :reviews, only: [:index]
      end
    end
  end

  devise_for :users
  root 'static_pages#index'
end
