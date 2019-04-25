Rails.application.routes.draw do
  get '/login',to: 'sessions#new'
  post 'login',to: 'session#create'
  delete 'logout',to: 'session#destroy'
  namespace :admin do
    resources :users
  end
  
  
  resources:tasks
  root to:'tasks#index'
end
