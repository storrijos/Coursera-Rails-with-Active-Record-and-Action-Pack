Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root to: "todo_lists#index"

  resources :sessions, only: [:new, :create, :destroy]
  
  resources :todo_lists do
    resources :todo_items
  end

  get '/login' => "sessions#new", as: "login"

  delete '/logout' => "sessions#destroy", as: "logout"
  
end
