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

  ##############
  # NAVIGATION #
  ##############

  root 'home#index'
  get '/about' => 'about#index'


end
