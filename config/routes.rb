Rails.application.routes.draw do
  resources :shops
  devise_for :users, controllers:{ registrations: "registrations" }
  root 'home#home'

  get 'm_dashboard' => 'merchant#dashboard'

  get 'dashboard' => 'buyer#dashboard'


  # namespace :merchant do
  #   resources :shops
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
