class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy, :closeIssue, :openIssue]
 # helper_method :sort_column, :sort_direction

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
    #@opened = Issue.where(open: true)
    #@mines = Issue.where(user: 'LoggedUser')
    #@watching = Watch.where()
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
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
  def create
    
    @issue = Issue.new(issue_params)  
    @issue.user = current_user.name
    @issue.votes = 0
    @issue.open = true
    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
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
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json  
  def closeIssue
    respond_to do |format|
      @issue.update(:open=>false)
      format.html { redirect_to issues_url, notice: 'Issue was successfully closed.' }
    end
  end
  
    # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def openIssue
    respond_to do |format|
      @issue.update(:open=>true)
      format.html { redirect_to issues_url, notice: 'Issue was successfully opened.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      # params.require(:issue).permit(:issue, :description, :user)
       params.require(:issue).permit(:issue, :description, :user, :open, :votes, :category)
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
  
#end
