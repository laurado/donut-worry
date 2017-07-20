Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'
  resources :users

  resources :bakeries, only: [:index] do
    resources :reviews, only: [:index]
  end
end
