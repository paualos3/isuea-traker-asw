Rails.application.routes.draw do
  resources :comments
  resources :comments
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]

  root to: "issues#index"
  
  resources :issues
  resources :users
  
  get 'opened', to: 'issues#openIssues'
  get 'closed', to: 'issues#closeIssues'
  get 'mine', to: 'issues#mine'
  
  get 'closeIssue', controller: "issues", action: "closeIssue"
  get 'openIssue', controller: "issues", action: "openIssue"
  get 'isOpen', controller: "issues", action: "isOpen"

end
