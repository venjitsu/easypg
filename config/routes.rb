Rails.application.routes.draw do
  devise_for :users
  root 'epgs#index'

  resources :services
  resources :epgs
  resources :schedules

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
