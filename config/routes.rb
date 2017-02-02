Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users do
    resources :locations
    resources :trips do
      resources :locations
    end
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  get '/contact', to: 'static_pages#contact'
end
