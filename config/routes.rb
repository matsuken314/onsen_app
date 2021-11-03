Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "onsens#index"
  resources :onsens
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  get "/users/:id", to: "users#show", as: "user"
end
