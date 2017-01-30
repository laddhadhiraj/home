Rails.application.routes.draw do

  devise_for :users

  root 'pages#index'

  resources :integrations
  resources :appointments
  resources :patients

  get 'pages/index'
  get 'pages/about'
  get 'pages/feature'
  get 'pages/contact'

  get 'fetch_patients', to: 'patients#fetch_patients'
  get 'fetch_appointments', to: 'appointments#fetch_appointments'


end
