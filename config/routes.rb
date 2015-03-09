Rails.application.routes.draw do
  root to: 'sessions#show'
  post '/sessions' => 'sessions#create'
  resources :users
  resources :tasks
end
