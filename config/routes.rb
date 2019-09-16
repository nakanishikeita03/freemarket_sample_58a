Rails.application.routes.draw do
  resources :mypages
  resources :logout

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'

  resources :signup do
    collection do
      get 'index' #新規会員登録ページTOPへ移動
      get 'step2' #【新規会員登録】電話番号認証ページへ移動
      get 'step3' #【新規会員登録】住所入力ページへ移動
    end
  end

end
