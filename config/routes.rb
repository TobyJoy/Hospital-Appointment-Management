Rails.application.routes.draw do
  
  root :to => "home#sign_in"
  
  resources :home, only: [:index]
  post "sessions_create" => 'home#sessions_create', as: "sessions_create"
  get "sign_up" => 'home#sign_up', as: "sign_up"
  post "new_registration" => 'home#new_registration', as: "new_registration"
  
  resources :users
  resources :doctors
  resources :patients
  resources :appointments
end
