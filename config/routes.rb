Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :missions, only: [:index, :show]
      resources :listings, only: [:index, :show, :update, :create, :destroy]
      resources :bookings, only: [:index, :show, :update, :create, :destroy]
      resources :reservations, only: [:index, :show, :update, :create, :destroy]
    end
  end
end
