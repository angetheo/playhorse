Rails.application.routes.draw do

  # Reminder: admin is only navigation and session control, since we don't have a database behind.
  # Reminder: every resource backed by a db should have its own restful routing.

  #########
  # ADMIN #
  #########

  namespace :admin do
    # ROOT
    root to: 'home#index'
    # SESSION
    match 'login' => 'admin#login', via: [:get, :post]
    get 'logout' => 'admin#logout'
    # PAGES
    get 'articles' => 'articles#index'
    get 'events' => 'events#index'
    get 'horses' => 'horses#index'
    get 'faq' => 'faq#index'
    get 'products' => 'products#index'
    get 'staff' => 'staff#index'
    get 'tools' => 'tools#index'
    get 'mares' => 'mares#index'
  end

  #############
  # RESOURCES #
  #############

  # FAQ
  resources :faq
  # ARTICLES
  resources :articles
  # CAROUSEL
  resources :carousel, only: [:show, :update]
  # SERVICES
  resources :service, only: [:show, :update]
  # EVENTS
  resources :events
  # HORSES
  resources :horses
  # PRODUCTS
  resources :products
  post 'products/search' => 'products#search'
  # STAFF
  resources :staff
  # CONTACT
  post 'contact' => 'application#contact'
  # MARES
  resources :mares
  # SUBSCRIBERS
  resources :subscribers, only: [:create, :destroy]
  # COMMUNICATIONS
  put 'communications' => 'communications#update'

  ##############
  # NAVIGATION #
  ##############

  root 'home#index'
  get 'agriturismo' => 'farmhouse#index'


end
