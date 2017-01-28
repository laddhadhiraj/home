Rails.application.routes.draw do

  resources :users do
    resources :appointments
  end
  root 'pages#index'

  devise_for :users

  resources :integrations

  get 'pages/index'

  get 'pages/about'

  get 'pages/feature'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
