module AuthoritzationHelper
  # returns true/false
  # sets @current_user if the request is authenticated 
  def authenticate!
    return true if current_user  # avoid re-querying the DB
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(oauth_token: token) 
    end
  end
end