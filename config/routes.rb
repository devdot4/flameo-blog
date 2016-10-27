Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Welcome routes
  get '/' => 'welcome#index'
  get '/about-us' => 'welcome#about_us'

  # Users routes
  get '/users' => 'users#index'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  put '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  # Posts routes
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  put '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'
end
