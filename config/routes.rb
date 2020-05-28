Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boats, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:show] do
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
    resources :boats, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show] do
    member do
      patch :accepted, :declined
    end
  end
end
