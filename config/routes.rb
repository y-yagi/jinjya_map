Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  root 'shrines#index'

  resources :deities
  resources :shrines do
    get :search, on: :collection
  end
end
