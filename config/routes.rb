Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :railway_stations
  resources :trains
  resources :routes
end
