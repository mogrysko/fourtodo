Rails.application.routes.draw do
  root to: 'sessions#show'
  post '/sessions' => 'sessions#create'
  resources :users
  resources :lists, shallow: true do
    resources :tasks, except: [:index]
  end
end
