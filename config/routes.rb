Rails.application.routes.draw do

  root 'home#index'

  # FAQ
  resources :faqs
  resources :articles

  # ABOUT
  get '/about' => 'about#index'
  
  # ADMIN LOGIN/LOGOUT
  match '/admin/login' => 'admin/admin#login', via: [:get, :post]
  get '/admin/logout' => 'admin/admin#logout'
  get '/admin' => 'admin/home#index'

  # CAROUSEL
  get '/admin/home/carousel/:id' => 'carousel#show'
  put '/admin/home/carousel/:id' => 'carousel#edit'

  # SERVICES
  get '/admin/home/services/:id' => 'service#show'
  put '/admin/home/services/:id' => 'service#edit'

end
