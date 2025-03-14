Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :category_translations, only: [ :index, :new, :create ]
    resources :treatment_translations, only: [ :index, :new, :create ]
  end

  namespace :api do
    resources :categories, only: [ :index ]
    resources :treatments, only: [ :index, :show ]
  end

  # SPA endpoint
  resources :client, only: [ :index ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # The root path route ("/")
  root "client#index"
end
