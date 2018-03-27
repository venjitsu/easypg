Rails.application.routes.draw do
  devise_for :users 

  resources :services
  resources :epgs
  resources :schedules

  put 'current_services', to: 'current_services#update'

  root 'epgs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
