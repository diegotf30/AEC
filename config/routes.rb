Rails.application.routes.draw do
  devise_for :members

  namespace :admin do
    resources :members
    resources :groups
    resources :sectors
    resources :cities
    resources :countries

    root 'members#index'
  end

  authenticated :member do
    root 'country#index', as: :authenticated_root
  end

  resources :users, only: [:show, :new]

  root 'root#show'
end
