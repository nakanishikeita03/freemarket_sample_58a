Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :products
  resources :mypages,only: :index,
  resources :logout,only: :index,
  root 'products#index'

end
