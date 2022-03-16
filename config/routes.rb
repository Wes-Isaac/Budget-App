Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'categories#index'

  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :payments, only: [:index, :show, :new, :create]
  end

end
