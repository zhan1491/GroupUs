GroupUs::Application.routes.draw do
  get   '/login', :to => 'sessions#new', as: :login
  get   '/logout' => 'sessions#destroy', as: :logout
  get   "/auth", to: redirect("http://api.groupme.com/oauth/authorize?client_id=#{ENV['GROUPME_API_KEY']}"), as: :auth
  get   '/auth/callback' => 'sessions#create'
  get   '/auth/failure', :to => 'sessions#failure'
  
  get   '/groups', :to => 'groups#index', as: :groups
  get   '/groups/show', :to => 'groups#show', as: :show_group
  get   '/groups/messages', :to => 'groups#messages', as: :messages
  root  to: 'sessions#new'
end
