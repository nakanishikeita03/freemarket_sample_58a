Rails.application.routes.draw do
 
  get '/mypage/identification', to: 'mypages#identification'
  get '/mypage/profile', to: 'mypages#profile'
  get '/mypage/card', to: 'mypages#card'
  get '/mypage/card/new', to: 'mypages#card_new'
  get '/addresses/new', to: 'addresses#step3'
  get '/card/new', to: 'card#step4'
  delete '/card/destroy', to: 'card#destroy'
  get '/signup/done', to: 'signup#done'
  root 'products#index'
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
  resources :addresses,only:[:create]
  resources :card,only:[:create]
  resources :searches,only:[:index]
  

  resources :signup do
    collection do
      get 'index'
      get 'done' 
    end
  end

  devise_scope :user do
    get    'users/signup/registration',   to: 'users/registrations#step1'
    get    'users/signup/sms_confirmation',      to: 'users/registrations#step2'
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
    end
  end

  post 'card/pay' => 'card#pay'

  resources :products,only:[:show] do
    get 'card/pay', to: 'card#pay'
    get 'card/confirmation', to:'card#confirmation'
    get 'card/complete', to:'card#complete'
  end





end

