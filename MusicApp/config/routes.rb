Rails.application.routes.draw do
  resources :albums, only: [:create, :edit, :update, :destroy]
  resources :tracks, only: [:create,:edit, :show, :update, :destroy]
  resources :albums do 
    resources :tracks, only: [:new, :create]
  end

  resources :bands
  resources :bands do
    resources :albums, only: [:new, :create]
  end

  resources :users, only: [:new, :index, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
