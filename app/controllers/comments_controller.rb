class CommentsController < ApplicationController
  include ActionView::Helpers::DateHelper
  
  
  def index
    respond_to do |format|
      format.html { 
        if !current_user
          redirect_to "/auth/google_oauth2" and return
        end
      }
      format.json {
        resp = authenticate
        if resp == nil
          return
        end
      }
    end
    @comments = Comment.where(issue_id: params[:issue_id])
    @filtred = Array.new
    @comments.reverse_each do |variable|
      @filtred.push(variable.as_json(methods: [:userName,:hoursAgo,:body],
                                          except: [:created_at, :updated_at, :name]))
    end
    respond_to do |format|
      format.html {}
      format.json {render :json => @filtred, status: :ok}
    end
  end
  
  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_to do |format|
      format.html { 
        if !current_user
          redirect_to "/auth/google_oauth2" and return
        end
      }
      format.json {
        resp = authenticate
        if resp == nil
          return
        end
      }
    end
    @comments = Comment.where(issue_id: params[:issue_id])
    @comments = @comments.where(id: params[:id])
    @filtred = Array.new
    @comments.reverse_each do |variable|
      @filtred.push(variable.as_json(methods: [:userName,:hoursAgo,:body],
                                          except: [:created_at, :updated_at, :name]))
    end
    respond_to do |format|
      format.html {}
      format.json {render :json => @filtred, status: :ok}
    end
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    
    
    
  end

  # POST /comments
  # POST /comments.json
  def create
    
    respond_to do |format|
      format.html { 
        if !current_user
          redirect_to "/auth/google_oauth2" and return
        end
      }
      format.json {
        resp = authenticate
        if resp == nil
          return
        end
        authenticateCreation
     #   pe=resp
        params[:comment][:user_id]=resp.id
      }
    end
    @issue = Issue.find(params[:issue_id])

    @comment = @issue.comments.create(params[:comment].permit(:body, :user_id))
    #        resp = authenticate

    respond_to do |format|
      format.html { redirect_to issue_path(@issue) }
      format.json {render :json => @comment.as_json(methods: [:userName,:hoursAgo,:body],
                                          except: [:created_at, :updated_at, :name]), status: :ok}
    #  format.json {render :json => comment_params.as_json()}
    end
  end 
  
  
  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      format.html { 
        if !current_user
          redirect_to "/auth/google_oauth2" and return
        end
      }
      format.json {
        resp = authenticate
        if resp == nil
          return
        end
        authenticateCreation
     #   pe=resp
     #   params[:comment][:user_id]=resp.id
      }
    end
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json {render :json => @comment.as_json(methods: [:userName,:hoursAgo,:body],
                                          except: [:created_at, :updated_at, :name]), status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    respond_to do |format|
        format.html {}
        format.json { 
          if @comment.user != authenticate 
            raise ActionController::ParameterMissing.new("You cannot delete a comment that is not yours")
          end
        }
    end
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def comment_params
      params.permit(:body, :issue_id, :user_id, :comment)
  end
  
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      #return User.find_by(oauth_token: token)
      user = User.find_by(oauth_token: token)
      if user == nil
      # respond_to( :json => {:error => "Forbidden custom error", :status => 403}, :status => :not_found)
        render :json => {:error => "Forbidden custom error", :status => 403}, :status => :not_found
        #redirect_to :action => 'forbidden', :status => 403 # do whatever you want here
        return nil
      end
      return user
    end
  end
    
  def authenticateCreation
    if session[:user_id]
      return false
    else
      authenticate_or_request_with_http_token do |token, options|
        @user = User.find_by(oauth_token: token) 
        session[:user_id] = @user.uid 
      end
    end
  end
end