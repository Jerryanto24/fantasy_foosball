Rails.application.routes.draw do
  
  resources :matches
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #we route
  namespace :admin do
      resources :users
      resources :teams
      resources :foosball_leaderboards
      
      resources :matches do
			collection do
				get :get_players
			end
    end
    
  end  

end
