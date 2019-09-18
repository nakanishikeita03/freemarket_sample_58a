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
  get '/mypage/card', to: 'mypages#card'
  get '/mypage/card/create', to: 'mypages#card_new'
  root 'products#index'

  resources :signup do
    collection do
      get 'index' #新規会員登録ページTOPへ移動
      get 'step2' #【新規会員登録】電話番号認証ページへ移動
      get 'step3' #【新規会員登録】住所入力ページへ移動
      get 'step4' #【新規会員登録】支払い方法登録ページへ移動
      get 'done' #【新規会員登録】完了ページへ移動
    end
  end

end

