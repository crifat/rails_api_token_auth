Rails.application.routes.draw do
  resources :movies
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
