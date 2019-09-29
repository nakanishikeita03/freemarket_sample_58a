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
  resources :addresses,only:[:create]
  resources :card,only:[:create]
  get '/mypage/identification', to: 'mypages#identification'
  get '/mypage/profile', to: 'mypages#profile'
  get '/mypage/card', to: 'mypages#card'
  get '/mypage/card/new', to: 'mypages#card_new'
  get '/addresses/new', to: 'addresses#step3'
  get '/card/new', to: 'card#step4'
  delete '/card/destroy', to: 'card#destroy'
  get '/signup/done', to: 'signup#done'
  root 'products#index'

  get '/category/:id',to: 'category#category'
  get '/category2/:id',to: 'category#category2'
  get '/category3/:id',to: 'category#category3'

  resources :signup do
    collection do
      get 'index' #新規会員登録ページTOPへ移動
      get 'done' #【新規会員登録】完了ページへ移動
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

