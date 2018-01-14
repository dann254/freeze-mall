Rails.application.routes.draw do
  root 'home#home'

  get 'register' => 'home#register'
  get 'login' => 'home#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
