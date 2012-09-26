Ticketee::Application.routes.draw do

  get "users/confirmation"

  get "users/index"

  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => 'confirm_user'

  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :projects do 
    resources :tickets
  end

  namespace :admin do
    root :to => "base#index"
    resources :users
  end


  root :to => "projects#index"
end
