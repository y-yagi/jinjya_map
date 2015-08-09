Rails.application.routes.draw do
  root 'shrines#index'
  get  'index/search'

  resources :deities
  resources :shrines do
    get :search, on: :collection
  end
end
