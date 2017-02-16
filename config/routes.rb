Rails.application.routes.draw do
  root to: 'homes#index'
  get '/contact', to: 'static_pages#contact'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:index, :show, :following, :followers] do
    resources :locations, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :trips, only: [:index, :new, :create, :show, :destroy] do
      get '/locations/new', to: 'locations#trip_new'
      post '/locations', to: 'locations#trip_create'
    end
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
end
