Rails.application.routes.draw do
  root to: 'tweets#index'
  resource :session
  resources :tweets
end
