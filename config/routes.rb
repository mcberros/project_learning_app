ProjectLearningApp::Application.routes.draw do
  resources :projects do
    resources :stories
  end

  resources :stories
  
	root to: 'home#index'

end
