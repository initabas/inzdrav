class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_filter :load_commentable, :registered!
  # GET /comments
  # GET /comments.json
  def index
    @comments = @commentable.comments.scoped
    
#     respond_to do |format|
#       format.html # index.html.erb
#     end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @parent_id = params[:parent_id]
    @comment = @commentable.comments.new(:commentable_id => @commentable.id,
																				 :commentable_type => @commentable.class.to_s)
    @comment.parent_id = @parent_id
    respond_to do |format|
      format.html # new.html.erb
      if @parent_id.nil?
      	format.js {render :action => "new"}
      else
        format.js {render :action => "reply"}
			end
    end
  end
	
  # GET /comments/1/edit
  def edit
		respond_to do |format|
			format.html # edit.html.erb
      format.js
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.new(comment_params.merge(:user_id => current_user.id))
    @parent_id = comment_params[:parent_id]
    respond_to do |format|
      if @comment.save
#        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @comment }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
  
  def comments
    @comments = @commentable.comments.arrange(:order => :created_at)
    @comment = Comment.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commentable_id, :commentable_type, :content, :user_id, :ancestry, :parent_id)
    end
    
   def load_commentable
     	 #resource = request.path.split('/')[1, 2]
	 	 @commentable = params[:commentable].classify.constantize.find(commentable_id)
  end
  
  def commentable_id
	  params[(params[:commentable].singularize + "_id").to_sym]
	end
	
	def registered!
		unless user_signed_in?
			redirect_to medications_url, :alert => "Access Denied"
		end
	end
end
