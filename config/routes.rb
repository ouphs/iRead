Rails.application.routes.draw do


  resources :posts do
    resources :comments, shallow: true, only: [:create, :destroy] 
  end

  #post '/posts/:id', to: 'posts#show'
  # commented out because of resources :posts
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/show'
  # get 'posts/destroy'
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/show'
  # get 'posts/destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  
  resources :users
  # commented out because resourses :users
  # get 'users/index'
  # get 'users/new'
  # get 'users/show'
  # get 'users/edit'

  
  
  root 'welcome#index'

end
