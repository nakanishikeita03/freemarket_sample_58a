Rails.application.routes.draw do
  resources :mypages
  resources :logout
  resources :card

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'

end