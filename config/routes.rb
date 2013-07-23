ProjectLearningApp::Application.routes.draw do
  get "password_resets/new"

  get "sessions/new"

  resources :projects do
    resources :stories
  end

  resources :stories

  resources :stories do
    resources :tasks
  end
  
  resources :tasks

  
  get 'sign_up', to: 'users#new', :as => 'sign_up'
  #  root :to => "users#new"
  resources :users
  
  get 'log_in', to: 'sessions#new', :as => 'log_in'
  get 'log_out', to: 'sessions#destroy', :as => 'log_out'
  resources :sessions
  
  resources :password_resets

	root to: 'home#index'

end
