json.extract! comment, :id, :issue_id, :body, :user_id, :created_at, :updated_at, :getUserName
json.url comment_url(comment, format: :json)