Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#homepage"

  resources :books, only: [:index, :show, :destroy, :new, :create], shallow: true do
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :users, only: [:show]
  resources :authors, only: [:index, :show, :destroy]
end
