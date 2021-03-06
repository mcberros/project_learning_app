ProjectLearningApp::Application.routes.draw do
  resources :locations
  
  resources :articles
  get 'tags/:tag', to: 'articles#index', as: :tag


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
  resources :user_steps
  
  get 'log_in', to: 'sessions#new', :as => 'log_in'
  get 'log_out', to: 'sessions#destroy', :as => 'log_out'
  resources :sessions
  
  resources :password_resets

  resources :messages
  
  resources :surveys
  
  #resources :products
  
  resources :categories
  
  resources :products do
    collection do
      post :edit_multiple
      put :update_multiple
    end
  end

	root to: 'home#index'

end
