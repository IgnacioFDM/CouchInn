Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  #root to: 'couch_posts#show'
  get '/mycouchposts' => 'couch_posts#mycouchposts', as: 'mycouchposts'
  devise_for :users
  resources :users
  resources :couch_types
  resources :couch_posts
  resources :couch_reservation_requests
end
