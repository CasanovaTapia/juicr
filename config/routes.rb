Rails.application.routes.draw do
  resources :categories
  resources :asks do
    resources :offers, only: [:create, :destroy, :update]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  get 'static/home'
  get 'static/about'
  get 'static/help'

  root to: 'static#home'
end
