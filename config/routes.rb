Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  resources :issues
  resources :users
  root 'issues#index'
end
