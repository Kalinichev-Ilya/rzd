Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :railway_stations do
    patch :set_number, on: :member
  end

  resources :trains do
    resources :wagons, shallow: true
  end

  resources :routes

  resource :search, only: %i[new show]
end
