Rails.application.routes.draw do
  devise_for :users
  root to: 'application#home'
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
