Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Welcome routes
  get    '/'               => 'welcome#index', as: 'root'
  get    '/about-us'       => 'welcome#about_us'

  # Users index
  get    '/users'          => 'users#index', as: "users"
  # Signup
  get    '/signup'         => 'users#new',   as: "new_user"
  # Users routes
  post   '/users'          => 'users#create'
  get    '/users/:id'      => 'users#show',  as: "user"
  get    '/users/:id/edit' => 'users#edit',  as: "edit_user"
  put    '/users/:id'      => 'users#update'
  patch  '/users/:id'      => 'users#update'
  delete '/users/:id'      => 'users#destroy'
  # Signin
  get    '/signin'          =>  "users#signin"
  post   '/signin'          =>  "users#create_signin"
  # Signout
  get    '/signout'         =>  "users#signout"
  # delete '/signout'         => 'users'

  # Posts routes
  get    '/posts'          => 'posts#index', as: "posts"
  get    '/posts/new'      => 'posts#new',   as: "new_post"
  post   '/posts'          => 'posts#create'
  get    '/posts/:id'      => 'posts#show',  as: "post"
  get    '/posts/:id/edit' => 'posts#edit',  as: "edit_post"
  put    '/posts/:id'      => 'posts#update'
  patch  '/posts/:id'      => 'posts#update'
  delete '/posts/:id'      => 'posts#destroy'

  # Comments routes
  post '/posts/:id/comments' => 'comments#create', as: "comment"
  get '/posts/:id/comments' => 'posts#show'
end
