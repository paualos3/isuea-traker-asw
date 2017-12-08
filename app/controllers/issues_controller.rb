class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy, :openIssue, :onHoldIssue, :resolveIssue, :duplicateIssue, :invalidateIssue, :wontfixIssue, :closeIssue, :destroycomment, :upvote, :downvote, :download_file, :editcomment]
  helper_method :sort_column, :sort_direction

  # GET /issues
  # GET /issues.json
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

    @issues = Issue.all
    @given_priority = params[:priority]
    @given_status = params[:status]
    if (@given_status == "On%20holded")
      @given_status = "On holded"
    end
    @given_category = params[:category]
    error =""
    
    @issues = @issues.order(sort_column + " " + sort_direction)
    if (@given_status != nil)
      if (['Invalid', 'Duplicated','Resolved','Wontfixed','Closed','On holded','Opened'].include? @given_status )   
       @issues = @issues.where(status: @given_status).order(sort_column + " " + sort_direction)
      elsif  (@given_status != nil )  
       error = "Invalid status 4"
      end
    end
    if (@given_priority != nil)
      if (['Trivial', 'Minor','Major','Critical','Blocker'].include? @given_priority )   
       @issues = @issues.where(priority: @given_priority).order(sort_column + " " + sort_direction)
      elsif  (@given_priority != nil )  
       error = "Invalid priority 3"
      end
    end
    if (@given_category != nil)
      if (['Task', 'Bug','Proposal','Enhancement'].include? @given_category )   
       @issues = @issues.where(category: @given_category).order(sort_column + " " + sort_direction)
      elsif  (@given_category != nil )  
       error = "Invalid category 2"
      end
    end
      
    respond_to do |format|
      if error != ""
        format.html { redirect_to @issue, notice: error }
        format.json {
          jfjfjfj
           render :json => {:error => error, :status => 400}, :status => :bad_request
        }
      
      else
        format.html {
          
        }
        format.json { #es como hacer un IF

          #authenticate
          @filtraje = Array.new
          @issues.reverse_each do |var|
            @filtraje.push(var.as_json(except: [:pinnedId, :votes], methods:[:Votes] ) )
          end
          
            render :json => @filtraje.as_json()
      
        }
      end

    end
    
  end
  
  def decoded_auth_token
    @decoded_auth_token ||= http_auth_header
  end
  
  def http_auth_header 
    if headers['Authorization'].present? 
      return headers['Authorization'].split(' ').last 
    else 
      asdasdas # aixo fa petar xD
      errors.add(:token, 'Missing token') 
    end 
  end

  def openIssues
    logger.debug("Opened function at controller")
    @issues = Issue.where(status: 'Opened').order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end
  
  def onHoldIssues
    logger.debug("Opened function at controller")
    @issues = Issue.where(status: 'On holded').order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end  
  
  def resolveIssues
    logger.debug("Opened function at controller")
    @issues = Issue.where(status: 'Resolved').order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end
  
  def duplicateIssues
    logger.debug("Opened function at controller")
    @issues = Issue.where(status: 'Duplicated').order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end
  
  def invalidateIssues
    logger.debug("Opened function at controller")
    @issues = Issue.where(status: 'Invalid').order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end
  
  def wontfixIssues
    logger.debug("Opened function at controller")
    @issues = Issue.where(status: 'Wontfixed').order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end
  
  def issuesStatus
    @given_status = params[:status]
    error =""
    if (['Invalid', 'Duplicate','Resolved','Wontfix','Closed','On hold','Opened'].include? @given_status )
      error = "Invalid status"
    else
      @issues = Issue.where(status: @given_status).order(sort_column + " " + sort_direction)
    end
    
    respond_to do |format|
      if error != ""
        format.html { redirect_to @issue, notice: error }
        format.json {
           render :json => {:error => error, :status => 400}, :status => :bad_request
        }
      
      else
        format.html {}
        format.json { #es como hacer un IF
          #@user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
          render :json => @issues
        }
      end

    end
    
    
    
  end
  
  def closeIssues
    logger.debug("Opened function at controller")
    @issues = Issue.where(status: 'Closed').order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end
  
  def mine
    logger.debug("Opened function at controller")
    @issues = Issue.where(user: current_user.name).order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        #authenticate
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end
  end
  
  def watching
    logger.debug("Opened function at controller")
    @issues = Issue.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issues.as_json(except: [:pinnedId,:votes], methods:[:Votes])
      }
    end#de moment he fet servir la de closed per provar que funcionés
    #@issues = Issue.where(watching: true || user: current_user.nam).order(sort_column + " " + sort_direction) hauria de ser quelcom similar a aquesta
  end
  
  def taskIssues
    @issues = Issue.where(category: 'Task')
  end
  
  def bugIssues
    @issues = Issue.where(category: 'Bug')
  end
  
  def enhancementIssues
    @issues = Issue.where(category: 'Enhancement')
  end
  
  def proposalIssues
    @issues = Issue.where(category: 'Proposal')
  end
  
  def trivialIssues
    @issues = Issue.where(priority: 'Trivial')
  end
  
  def minorIssues
    @issues = Issue.where(priority: 'Minor')
  end
  
  def majorIssues
    @issues = Issue.where(priority: 'Major')
  end
  
  def criticalIssues
    @issues = Issue.where(priority: 'Critical')
  end
  
  def blockerIssues
    @issues = Issue.where(priority: 'Blocker')
  end
  
  
  def sort_column
    sortValue = params[:sort]
    if sortValue == nil
      sortValue = "created_at"
    end
    Issue.column_names.include?(sortValue) ? sortValue : sortValue
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def destroycomment
    @comment=params[:comment]
    logger.debug("destroycomment", @comment)
    @issue.comments.delete(@comment)
      redirect_to @issue, notice: 'Comment was successfully deleted.' 
    
  end
  
  def editcomment
    @comment = Comment.find(params[:mcomment])
    @bodyUpdate = params[:comment][:body]
    @comment.body = @bodyUpdate
    #15, :user_name => 'Samuel', :group => 'expert'
    @issue.comments.update(params[:mcomment],:body =>  @bodyUpdate)
      redirect_to @issue, notice: 'Comment was successfully updated.' 
    
  end
  
  def download_file
    @issue = Issue.find(params[:id])
    send_file(@issue.attachment.path, :disposition=>'attachment' , :url_based_filename=>false)
  end




  # GET /issues/1
  # GET /issues/1.json
  def show
     respond_to do |format|
      format.html {}
      format.json { #es como hacer un IF
        render :json => @issue.as_json(except: [:pinnedId,:votes], methods: [:Votes])
      }
    end
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create # TO DOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO descomentar linia del usuari
    @title = params[:title]
    
    @issue = Issue.new(issue_params)  
    if (@title != nil)  
      @issue.issue = @title
    end
   # @issue.user = current_user.name
    @issue.votes = 0
    @issue.status = 'Opened'
    @p = params[:issue][:priority]
    error = ""
    if (!['Trivial', 'Minor','Major','Critical','Blocker'].include? @p )
      error = "Invalid priority"
    end
    
    @p2 = params[:issue][:category]
    if (!['Task', 'Bug','Enhancement','Proposal'].include? @p2 )
      error = "Invalid category"
    end
    #Archivo subido por el usuario.
    archivo = params[:issue][:attachment];
    #logger.debug("Archivo: " + archivo)
    
    respond_to do |format|
      if error != ""
        format.html { redirect_to @issue, notice: error }
        format.json {
           render :json => {:error => error, :status => 400}, :status => :bad_request
        }
      
      elsif @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        #format.json { render :show, status: :created, location: @issue }
        format.json {
           render :json => @issue.as_json(except: [:pinnedId, :votes], methods:[:Votes] )
        }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    respond_to do |format|
        format.html {}
        format.json { 
          @user = authenticate
          if @issue.user != @user.name
            raise ActionController::ParameterMissing.new("You cannot delete a reply that is not yours")
          end
        }
    end
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def openIssue
    respond_to do |format|
      @issue.update(:status=>'Opened')
      format.html { redirect_to issues_url, notice: 'Issue was successfully opened.' }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def onHoldIssue
    respond_to do |format|
      @issue.update(:status=>'On holded')
      format.html { redirect_to issues_url, notice: 'Issue was successfully resolved.' }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def resolveIssue
    respond_to do |format|
      @issue.update(:status=>'Resolved')
      format.html { redirect_to issues_url, notice: 'Issue was successfully resolved.' }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def duplicateIssue
    respond_to do |format|
      @issue.update(:status=>'Duplicated')
      format.html { redirect_to issues_url, notice: 'Issue was successfully resolved.' }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def invalidateIssue
    respond_to do |format|
      @issue.update(:status=>'Invalid')
      format.html { redirect_to issues_url, notice: 'Issue was successfully resolved.' }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def wontfixIssue
    respond_to do |format|
      @issue.update(:status=>'Wontfixed')
      format.html { redirect_to issues_url, notice: 'Issue was successfully resolved.' }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json  
  def closeIssue
    respond_to do |format|
      @issue.update(:status=>'Closed')
      format.html { redirect_to issues_url, notice: 'Issue was successfully closed.' }
    end
  end
  
  #upvote_from user
  def upvote
    @issue.upvote_from current_user
    redirect_to @issue
  end
  
  #downvote_from user
  def downvote
    @issue.downvote_from current_user
    redirect_to @issue
  end
  
  def watch
    current_user.watch(params[:id])
    redirect_to @issue = set_issue
  end
  
  def unwatch
    current_user.unwatch(params[:id])
    redirect_to @issue = set_issue
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      #logger.debug("id: " , params[:id])
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      # params.require(:issue).permit(:issue, :description, :user)
       params.require(:issue).permit(:issue, :description, :user, :open, :votes, :category, :assignee, :attachment, :priority, :id)
    end
    
  end
  

  

  
   # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def closeIssueList
    respond_to do |format|
      format.html { redirect_to @issue, notice: 'Only closed issues'}
      format.json { render :closeIssues, status: :ok, location: @issue }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def openIssueList
    respond_to do |format|
      format.html { redirect_to @issue, notice: 'Only opened issues' }
      format.json { render :openIssues, status: :ok, location: @issue }
    end
  end
  
  
  def closed
    logger.debug "Hola" 
  end  
    
  def mineList
    respond_to do |format|
      format.html { redirect_to @issue, notice: 'Only my issues' }
      format.json { render :mine, status: :ok, location: @issue }
    end
  end
  
  def watchingList
    respond_to do |format|
      format.html { redirect_to @issue, notice: 'Only watching issues'}
      format.json { render :watching, status: :ok, location: @issue }
    end
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
#end
