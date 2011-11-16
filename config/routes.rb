SampleApp::Application.routes.draw do

  resources :users
  resources :pages

  match '/home',  :to => 'pages#home'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'

  
  root :to => 'pages#home'
end