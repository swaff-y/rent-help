Rails.application.routes.draw do

root to: 'pages#home'

get '/login'  => 'session#new'        # showing the login form
post '/login' => 'session#create'     # form submits to here, performs login, redirects
delete '/login' => 'session#destroy'  # logout link goes here, perform logout, redirect

resources :tenants
resources :owners
resources :properties
resources :users

end
