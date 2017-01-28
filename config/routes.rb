Rails.application.routes.draw do

  root 'pages#index'

  devise_for :users

  resources :integrations
  resources :appointments

  get 'pages/index'

  get 'pages/about'

  get 'pages/feature'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
