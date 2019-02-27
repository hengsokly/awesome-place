Rails.application.routes.draw do
  root to: 'api/v1/places#index'

  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :places, only: [:index, :show, :create, :update, :destroy]
      resource :token, only: [:create]
    end
  end
end
