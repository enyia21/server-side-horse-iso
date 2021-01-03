Rails.application.routes.draw do
  resources :reviews
  get 'sessions/login'
  resources :breeds
  resources :horses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#login'
  post 'autoLogin', to: 'sessions#autoLogin'
  get '/breeds/country/:country', to: 'breeds#by_country'
end
