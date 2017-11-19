json.extract! issue, :id, :issue, :description, :user, :created_at, :updated_at, :attachment
json.url issue_url(issue, format: :json)
