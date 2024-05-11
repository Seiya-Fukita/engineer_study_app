Rails.application.routes.draw do
  resources :users
  root 'home#index'

  get 'top' => 'home#top'
  get 'sign_up' => 'users/registrations#new'
  get 'password' => 'users/passwords#new'
  get 'confirmation' => 'users/confirmations#new'
  namespace :users do
    resources :confirmations
    resources :registrations
  end
end
