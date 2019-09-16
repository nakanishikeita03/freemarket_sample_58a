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
      get 'index'
      get 'step2'
      get 'step3'
    end
  end

end
