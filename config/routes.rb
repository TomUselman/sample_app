SampleApp::Application.routes.draw do
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  get "sessions/new"

  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :pages
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]

  match '/home',  :to => 'pages#home'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'

  
  root :to => 'pages#home'
end