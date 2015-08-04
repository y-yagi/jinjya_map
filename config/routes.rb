Rails.application.routes.draw do
  root 'index#index'

  resources :deities
  resources :shrines
end
