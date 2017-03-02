Rails.application.routes.draw do
  mount LetsencryptPlugin::Engine, at: '/'  # It must be at root level
  
  root 'static_pages#home'
  get    '/help',             to: 'static_pages#help'
  get    '/about',            to: 'static_pages#about'
  get    '/contact',          to: 'static_pages#contact'
  get    '/privacy_policy',   to: 'static_pages#privacy_policy'
  get    '/recruitment',      to: 'static_pages#recruitment'
  get    '/signup',           to: 'users#new'
  post   '/signup',           to: 'users#create'
  get    '/info',             to: 'users#info'
  post   '/info',             to: 'users#agree'
  get    '/apply',            to: 'trialapps#new'
  post   '/apply',            to: 'trialapps#create'
  get    '/questions',        to: 'trialapps#questions'
  #post   '/questions',        to: 'trialapps#answers'
  get    '/applications',     to: 'trialapps#index'
  get    '/edit',             to: 'trialapps#edit'
  post   '/accept',           to: 'trialapps#accept'
  post   '/reject',           to: 'trialapps#reject'
  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'
  resources :users
  resources :trialapps, :path => "applications"
  resources :account_activations,   only: [:edit]
  resources :password_resets,       only: [:new, :create, :edit, :update]
end

