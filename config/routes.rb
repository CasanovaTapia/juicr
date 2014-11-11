Rails.application.routes.draw do
  resources :categories, only: [:new, :create, :destroy]
  resources :asks

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'static/home'
  get 'static/about'
  get 'static/help'

  root to: 'static#home'
end
