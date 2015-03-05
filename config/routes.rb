Rails.application.routes.draw do
  default_url_options :host => "example.com"

  resources :categories

  resources :categories, only: [:show] do
    get :users
  end

  resources :asks do
    resources :offers, only: [:create, :destroy, :update] do
      resources :messages, only: [:create, :destroy, :update]
      get 'workrooms/project'
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  get 'static/home'
  get 'about', to: 'static#about', as: :static_about
  get 'help', to: 'static#help', as: :static_help
  get 'myasks', to: 'static#asks', as: :static_asks
  get 'terms', to: 'static#terms', as: :static_terms
  get 'privacy', to: 'static#policy', as: :static_policy
  get 'stories', to: 'static#stories', as: :static_stories

  resources :users, only: [:index, :show]

  root to: 'static#home'
end
