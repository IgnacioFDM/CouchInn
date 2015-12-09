Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  #root to: 'couch_posts#show'
  get '/my_couch_posts' => 'couch_posts#mycouchposts', as: 'my_couch_posts'
  get '/visited_couch_posts' => 'couch_posts#visitedcouchposts', as: 'visited_couch_posts'
  get '/main_pic_edit/:id', to: 'couch_posts#mainpicedit', as: 'main_pic_edit'
  get '/foreign_requests_index' => 'couch_reservation_requests#foreign_requests_index', as: 'foreign_requests_index'
  get '/couch_reservation_requests/date_filter_results' => 'couch_reservation_requests#date_filter_results', as: 'date_filter_results'
  match 'couch_reservation_requests/respond', to: 'couch_reservation_requests#respond', via: 'post'
  match 'user_premium/setpaid', to: 'user_premium#setpaidform', via: 'get', as: :setpaidform
  match 'user_premium/setpaid', to: 'user_premium#setpaid', via: 'post', as: :setpaid
  
  match 'user_premium/getpaid', to: 'user_premium#getpaidform', via: 'get', as: :getpaidform
  match 'user_premium/getpaid', to: 'user_premium#getpaid', via: 'post', as: :getpaid


  devise_for :users
  resources :users
  resources :couch_types
  resources :couch_posts
  resources :couch_post_feedbacks
  resources :couch_reservation_requests
  resources :user_feedbacks
  resources :user_premium 
end
