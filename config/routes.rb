Rails.application.routes.draw do
  root to: 'tweets#index'
  resource :session, only: [:new, :create, :destroy]
  resources :tweets, only: [:index, :create]
  resources :users, only: [:show], param: :name, format: false, constraints: { name: /[^\/]+/ }
  resources :followerships, only: [:create, :destroy], param: :name, format: false, constraints: { name: /[^\/]+/ }
end
