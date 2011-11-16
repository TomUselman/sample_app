SampleApp::Application.routes.draw do
  get "users/new"

  get "sessions/new"

  #get "users/new"
  resources :users
  resources :pages

  match '/home',  :to => 'pages#home'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'

  
  root :to => 'pages#home'
end