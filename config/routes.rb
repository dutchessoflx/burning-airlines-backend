Rails.application.routes.draw do

  root to: 'airplane#index'

  get '/airplanes' => 'airplanes#index'

  post '/airplanes' => 'airplanes#create'


  get '/flights' => 'flights#index'
  get '/flights/new' => 'flights#new'
  post '/flights' => 'flights#create'


  get '/users' => 'users#index'

  post '/users' => 'users#create'


  get '/reservations' => 'reservations#index'

  post '/reservations' => 'reservations#create'
end
