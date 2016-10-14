Rails.application.routes.draw do
  resources :categories
  resources :profiles, only: [:new, :edit, :create, :update, :show]

  get 'pages/home'

  root to: 'categories#index'
  resources :photos, only: [:destroy]

  resources :products do
    resources :shopping_carts
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
