Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :railway_stations do
    patch :set_position, on: :member
  end
  resources :trains
  resources :routes
  resources :wagons
end
