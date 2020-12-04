Rails.application.routes.draw do

root to: 'pages#home'
resources :tenants
resources :owners
resources :properties

end
