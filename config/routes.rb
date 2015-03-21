MyBackend::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :jobs
      resources :users, :only => [:show, :create]
      resources :job_types
    end
  end
  
end
