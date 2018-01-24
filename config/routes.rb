Rails.application.routes.draw do
  devise_for :users, controllers:{ registrations: "registrations" }
  root 'home#home'

  get 'm_dashboard' => 'merchant#dashboard'
  resources :shop_profile
  get 'dashboard' => 'buyer#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
