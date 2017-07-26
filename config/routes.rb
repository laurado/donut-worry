Rails.application.routes.draw do
  resources :bakeries, only: [:index, :show, :new, :create] do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :reviews, only: [:update]
      resources :bakeries, only: [:index]

      resources :bakeries, only: [:show] do
        resources :reviews
      end
    end
  end

  patch 'bakeries/:bakery_id/reviews/:id/edit', controller: 'reviews', action: :update

  devise_for :users
  root 'static_pages#index'
end
