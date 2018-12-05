Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#index"
  EXPOSED_ROUTES = [:index, :show, :destroy]
  resources :books, only: EXPOSED_ROUTES
  resources :authors, only: EXPOSED_ROUTES
end
