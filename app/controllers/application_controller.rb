class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception  
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session # , only: Proc.new { |c| c.request.format.json? }
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def hello
    render html: "hello, world!"
  end
  

  def record_not_found(error)
    render :json => {:error => error.message, :status => 404}, :status => :not_found
  end 
  
  
  
end
