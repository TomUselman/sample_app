SampleApp::Application.routes.draw do
  #get "users/new"
  resources :users
  resources :pages

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'users#login'
  match '/logout', :to => 'users#logout'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  
  root :to => 'pages#home'
end