MyBackend::Application.routes.draw do
  require 'sidekiq/web'


  defaults format: "json" do

    devise_for :users, controllers: { sessions: 'sessions', passwords: 'passwords', confirmations: 'confirmations' }

    namespace :v1, :defaults => {:format => :json} do

      mount Sidekiq::Web => 'sidekiq'

      resources :users, :only => [:update, :destroy,:create, :show]

      resources :accounts, :only => [:show,:update]

      resources :assignments, :only => [:show, :index, :create, :update, :destroy]  do
        patch "/state", to: "assignments#state", as: :state
      end
      resources :assignment_rewards
      resources :assignment_bids, :only => [:show, :create]
      resources :resources, :only => [:show, :index, :create, :update, :destroy] do
        patch "/state", to: "resources#state", as: :state
      end
      resources :match_user_users, :only => [:show, :create]
      resources :match_user_resources, :only => [:show, :create]
      resources :match_assignment_resources, :only => [:show, :create]
      resources :affiliations
      resources :intentions
      resources :languages
      resources :locations
      resources :skills
      resource :score_account_assignments do
        get "account_matches"
        get "assignment_matches"
      end
      resources :priorities do
        match :batch_create, via: [:post],  on: :collection
      end

      post 'share', to: 'share#create'

      post 'search/resource_search', to: 'search#resource_search'
      post 'search/account_search', to: 'search#account_search'
      post 'search/assignment_search', to: 'search#assignment_search'
    end
  end

end
