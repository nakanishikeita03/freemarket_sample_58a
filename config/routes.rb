Rails.application.routes.draw do

  devise_for :users
  # root 'products#index'
  root 'mypages#index'
  resources :mypages

end
