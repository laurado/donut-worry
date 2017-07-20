Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'
  resources :users

  resources :bakeries, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :bakeries, only: [:index, :create]
    end
  end
end
