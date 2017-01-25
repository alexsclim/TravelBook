Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users
  resources :users do
    resources :locations
  end

  get '/contact', to: 'static_pages#contact'
end
