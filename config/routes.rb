Rails.application.routes.draw do
  resources :users
  root "home#index"

  get "top" => "home#top"
end
