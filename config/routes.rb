Rails.application.routes.draw do
  default_url_options :host => "example.com"

  resources :categories

  resources :categories, only: [:show] do
    get :users
  end

  resources :asks do
    resources :offers, only: [:create, :destroy, :update] do
      get 'workrooms/project'
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  get 'static/home'
  get 'static/about'
  get 'static/help'
  get 'static/asks'
  get 'static/offers'
  get 'static/terms'
  get 'static/policy'

  resources :users, only: [:index, :show]

  root to: 'static#home'
end
