class SessionsController < ApplicationController
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to issues_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
