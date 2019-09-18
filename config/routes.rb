Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :products
  resources :mypages,only: [:index,]
  resources :logout, only: [:index,]
  resources :card,only:[:index]
  get '/mypage/identification', to: 'mypages#identification'
  get '/mypage/profile', to: 'mypages#profile'
<<<<<<< Updated upstream
=======
  get '/mypage/card', to: 'mypages#card'
  get '/mypage/card/create', to: 'mypages#card_new'
>>>>>>> Stashed changes
  root 'products#index'

end

