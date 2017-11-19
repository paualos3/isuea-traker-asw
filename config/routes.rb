Rails.application.routes.draw do

  resources :comments

  get 'sessions/create'

  get 'sessions/destroy'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]


  root 'home#index'

  resources :issues do 
    resources :comments
    member do
      put "like" => "issues#upvote"
      put "unlike" => "issues#downvote"
    end
  end
  resources :users
  
  get 'opened', to: 'issues#openIssues'
  get 'closed', to: 'issues#closeIssues'
  get 'mine', to: 'issues#mine'
  
  get 'destroycomment', controller: "issues" , action: "destroycomment"
  get 'closeIssue', controller: "issues", action: "closeIssue"
  get 'openIssue', controller: "issues", action: "openIssue"
  get 'isOpen', controller: "issues", action: "isOpen"

end