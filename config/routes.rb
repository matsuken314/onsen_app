Rails.application.routes.draw do
  root "homes#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    passwords: "users/passwords"
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/onsens/guest_sign_in", to: "onsens#guest_sign_in"
  get "onsens/search", to: "onsens#search"
  resources :onsens

  # resources :onsens do
  #   collection do
  #     get '/onsens/auto_complete'
  #   end
  # end
  post "bookmark/:id" => "bookmarks#create", as: "create_bookmark"
  delete "bookmark/:id" => "bookmarks#destroy", as: "destroy_bookmark"
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  get "/users/:id", to: "users#show", as: "user"
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show] do
    member do
      get :bookmarks
    end
  end
end
