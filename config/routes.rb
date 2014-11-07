Rails.application.routes.draw do
  devise_for :users
  
  get 'static/home'
  get 'static/about'
  get 'static/help'

  root to: 'static#home'
end
