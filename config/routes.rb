Rails.application.routes.draw do
  resources :mypages,only: [:index]
  resources :logout

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get '/mypage/identification', to: 'mypages#identification'
  get '/mypage/profile', to: 'mypages#profile'
  root 'products#index'
end
