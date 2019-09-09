Rails.application.routes.draw do
  get  'items' => 'items#index'
  root 'items#index'
end
