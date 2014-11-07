Rails.application.routes.draw do
  get 'static/home'
  get 'static/about'
  get 'static/help'

  root to: 'static#home'
end
