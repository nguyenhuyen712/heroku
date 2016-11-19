Rails.application.routes.draw do
  root "sessions#new"
  # get "/login", to "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/map", to: "maps#index"

  resources :users, except: [:destroy]
  resources :accidents, except: [:create, :update, :destroy]
end
