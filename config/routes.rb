Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :tests, only: :create
  resources :tasks, only: %i[show update]
  resources :results, only: %i[index show]

  root to: "pages#home"
end
