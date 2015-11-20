Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  #root to: 'couch_posts#show'
  get '/my_couch_posts' => 'couch_posts#mycouchposts', as: 'my_couch_posts'
  devise_for :users
  resources :users
  resources :couch_types
  resources :couch_posts
  resources :couch_reservation_requests
  resources :user_feedback
end
