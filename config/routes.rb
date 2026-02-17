Rails.application.routes.draw do
  devise_for :users
  resources :tasks

  authenticated :user do
    root "tasks#new", as: :authenticated_root
  end

  root to: redirect("/users/sign_in")

  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end
end
