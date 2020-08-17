Rails.application.routes.draw do
  devise_for :users
  root "static_pages#top_page"
  get "static_pages/membership_agreement", to: "static_pages#membership_agreement"
end
