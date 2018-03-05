Rails.application.routes.draw do
  resources :services
  resources :epgs
  resources :schedules

  # get 'schedules' ,to: 'schedules#index'
  # get 'schedules/:id', to: 'schedules#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
