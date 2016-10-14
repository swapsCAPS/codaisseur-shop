Rails.application.routes.draw do
  resources :categories
  get 'pages/home'

  root to: 'categories#index'

  resources :products do
    resources :shopping_carts
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
