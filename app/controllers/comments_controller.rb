class CommentsController < ApplicationController
  include ActionView::Helpers::DateHelper
  # GET /comments/1
  # GET /comments/1.json
  def show
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
    if !session
      redirect_to "/oauth/google_oauth2" and return
    end
    @issue = Issue.find(params[:issue_id])

    @comments = @issue.comments.create(params[:comment].permit(:body, :user_id))
    
    redirect_to issue_path(@issue)
  end 
  
  
  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
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
end
  


