Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :events, only: [:index]
  get "static_pages/membership_agreement", to: "static_pages#membership_agreement"
end
