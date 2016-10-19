Rails.application.routes.draw do
  resources :categories
  resources :profiles, only: [:new, :edit, :create, :update, :show]

  get 'pages/home'

  root to: 'categories#index'
  resources :photos, only: [:destroy]

  resources :products
  resources :orders, only: [:new, :create, :index, :show]

  resources :shopping_carts do
    collection do
      get 'increment'
    end
    collection do
      get 'decrement'
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
