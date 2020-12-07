Rails.application.routes.draw do

  get 'user/new'
  get 'user/create'
  get 'user/index'
  get 'user/show'
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
root to: 'pages#home'
resources :tenants
resources :owners
resources :properties

end
