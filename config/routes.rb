Rails.application.routes.draw do
  resources :applicants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "applicants#new"
end
