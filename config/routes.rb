Ticketee::Application.routes.draw do

  get "users/index"

  devise_for :users
  
  resources :projects do 
    resources :tickets
  end

  namespace :admin do
    root :to => "base#index"
    resources :users
  end


  root :to => "projects#index"
end
