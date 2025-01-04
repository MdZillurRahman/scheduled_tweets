# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # GET /about
  # get "about", to: "about#index"
  get "about-us", to: "about#index", as: :about

  # account sign_up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # account sign_in
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # account sign_out
  delete "logout", to: "sessions#destroy"

  # update profile
  get "profile", to: "profile#edit"
  patch "profile", to: "profile#update"

  # reset password
  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"

  # edit reset password
  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts

  root to: "main#index"
end
