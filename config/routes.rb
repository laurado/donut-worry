Rails.application.routes.draw do
  resources :bakeries, only: [:index, :show, :new, :create]

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
  get 'bakeries' => 'static_pages#index'
  get '/bakeries/:id' => 'static_pages#index'
end
