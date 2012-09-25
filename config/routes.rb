Ticketee::Application.routes.draw do

  get "users/index"

  devise_for :users
  
  resources :projects do 
    resources :tickets
  end

  namespace :admin do
    resources :users
  end


  root :to => "projects#index"
end
