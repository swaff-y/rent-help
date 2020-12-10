Rails.application.routes.draw do

root to: 'pages#home'

get '/login'  => 'session#new'        # showing the login form
post '/login' => 'session#create'     # form submits to here, performs login, redirects
delete '/login' => 'session#destroy'  # logout link goes here, perform logout, redirect

post '/tenants/link' => 'tenants#property_link'
post '/owners/link' => 'owners#property_link'

post '/property/image' => 'properties#image_upload'
post '/property/search' => 'properties#search'

post '/rating/:id/new' => 'ratings#update', as: "rate"

resources :tenants
resources :owners
resources :properties
resources :users
resources :ratings

end
