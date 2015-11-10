Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  #root to: 'couch_posts#show'
  match '/viewcouch' => 'visitors#viewcouch', :via => :get
  devise_for :users
  resources :users
  resources :couch_types
  resources :couch_posts
end
