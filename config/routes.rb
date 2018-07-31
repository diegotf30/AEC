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

  resources :members, only: [:show, :new]

  resources :countries, only: [:index, :show]
  resources :cities, only: [:new, :show]
  resources :sectors, only: [:new, :show]
  resources :groups, only: [:new, :show]

  resources :reports, only: [:index, :new]
  resources :attendances, only: [:create, :update]
end
