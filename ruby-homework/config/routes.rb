Rails.application.routes.draw do
  resources :posts
  resources :comments
  resources :authors
  get 'landing/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'
end
