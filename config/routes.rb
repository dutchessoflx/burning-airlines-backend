Rails.application.routes.draw do

  get 'page/new'
  get '/search' => 'pages#search', :as => 'search_page'
  get 'session/new'
  root to: "page#home"

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :airplanes
  resources :users
  resources :flights
  resources :reservations

end
