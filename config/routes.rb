Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :users
  root "home#index"

  get "top" => "home#top"
  get "sign_up" => "users/registrations#new"
  get "password" => "users/passwords#new"
  get "confirmation" => "users/confirmations#new"

  namespace :users do
    resources :confirmations
    resources :registrations
  end
end
