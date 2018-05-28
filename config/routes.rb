Rails.application.routes.draw do
  root to: 'tweets#index'
  resource :session, only: [:new, :create, :destroy]
  resources :tweets
end
