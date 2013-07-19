ProjectLearningApp::Application.routes.draw do
  resources :projects do
    resources :stories
  end

  resources :stories

  resources :stories do
    resources :tasks
  end
  
  resources :tasks
  
	root to: 'home#index'

end
