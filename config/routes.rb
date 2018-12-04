Rails.application.routes.draw do
  devise_for :members, controllers: {
    sessions: "auth/sessions",
    registrations: "auth/registrations"
  }

  devise_scope :member do
    root to: 'auth/sessions#new'
  end

  namespace :admin do
    resources :members
    resources :groups
    resources :sectors
    resources :cities
    resources :countries

    root 'members#index'
  end

  authenticated :member do
    root 'countries#index', as: :authenticated_root
  end

  namespace :onboarding do
    resource :verification, only: [:show]
  end

  resources :members

  resources :countries
  resources :cities
  resources :sectors
  resources :groups

  resources :reports, only: [:index, :new]
  resources :attendances, only: [:create, :update]
end
