Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :patients, except: [:show]
  resources :doctors, expect: [:show]  
end
