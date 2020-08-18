Rails.application.routes.draw do
  devise_for :users
  root "static_pages#top_page"
  get "static_pages/membership_agreement", to: "static_pages#membership_agreement"
  get "static_pages/test_page", to: "static_pages#test_page"
end
