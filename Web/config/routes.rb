Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  match '/viewcouch' => 'visitors#viewcouch', :via => :get
  devise_for :users
  resources :users
end
