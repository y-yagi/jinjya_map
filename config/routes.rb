Rails.application.routes.draw do
  root 'shrines#index'

  resources :deities
  resources :shrines do
    get :search, on: :collection
  end
end
