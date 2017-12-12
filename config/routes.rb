Rails.application.routes.draw do

  resources :comments

  get 'sessions/create'

  get 'sessions/destroy'
  get '/issues/mine', to: 'issues#mine'
  get '/issues/watching', to: 'issues#watching'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]


  root 'home#index'

  resources :issues do 
    resources :comments
    get :watchers
    member do
      put "like" => "issues#upvote"
      put "unlike" => "issues#downvote"
      put "watch" => "issues#watch"
      put "unwatch" => "issues#unwatch"
      put "edit" => "issues#edit"
    end
  end
  resources :users do
    get :watching
  end
  
  get '/issues/:id/attachment', to: 'issues#showAttachment'
  post '/issues/:id/attachment', to: 'issues#createAttachment'
  get 'Opened', to: 'issues#openIssues'
  get 'On holded', to: 'issues#onHoldIssues'  
  get 'Resolved', to: 'issues#resolveIssues'
  get 'Duplicated', to: 'issues#duplicateIssues'
  get 'Invalid', to: 'issues#invalidateIssues'
  get 'Wontfixed', to: 'issues#wontfixIssues'
  get 'Closed', to: 'issues#closeIssues'
  get 'Task', to: 'issues#taskIssues'
  get 'Bug', to: 'issues#bugIssues'
  get 'Enhancement', to: 'issues#enhancementIssues'
  get 'Proposal', to: 'issues#proposalIssues'
  get 'Trivial', to: 'issues#trivialIssues'
  get 'Minor', to: 'issues#minorIssues'
  get 'Major', to: 'issues#majorIssues'
  get 'Critical', to: 'issues#criticalIssues'
  get 'Blocker', to: 'issues#blockerIssues'
  
  post 'editcomment', controller: "issues", action: "editcomment"
  get 'destroycomment', controller: "issues" , action: "destroycomment"
  get 'openIssue', controller: "issues", action: "openIssue"
  get 'onHoldIssue', controller: "issues", action: "onHoldIssue"
  get 'resolveIssue', controller: "issues", action: "resolveIssue"
  get 'duplicateIssue', controller: "issues", action: "duplicateIssue"
  get 'invalidateIssue', controller: "issues", action: "invalidateIssue"
  get 'wontfixIssue', controller: "issues", action: "wontfixIssue"
  get 'closeIssue', controller: "issues", action: "closeIssue"
  get 'isOpen', controller: "issues", action: "isOpen"
  
end