class HelpfulsController < ApplicationController
  before_action :set_helpful, only: [:show, :edit, :update, :destroy]
  before_filter :load_helpfulness
  
  # GET /helpfuls
  # GET /helpfuls.json
  def index
    @helpfuls = @helpfulness.helpfuls.all
  end

  # GET /helpfuls/1
  # GET /helpfuls/1.json
  def show
  end

  # GET /helpfuls/new
  def new
    @helpful = @helpfulness.helpfuls.new
  end

  # GET /helpfuls/1/edit
  def edit
  end

  # POST /helpfuls
  # POST /helpfuls.json
  def create
    @helpful = @helpfulness.helpfuls.new(helpful_params.merge(:user_id => current_user.id))

    respond_to do |format|
      if @helpful.save
        current_user.flag(@helpfulness, :helpful)
        format.html { redirect_to [@medication, @helpful], notice: 'Helpful was successfully created.' }
        format.json { render action: 'show', status: :created, location: @helpful }
        format.js   { }
      else
        format.html { render action: 'new' }
        format.json { render json: @helpful.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helpfuls/1
  # PATCH/PUT /helpfuls/1.json
  def update
    respond_to do |format|
      if @helpful.update(helpful_params)
        format.html { redirect_to [@helpfulness, @helpful], notice: 'Helpful was successfully updated.' }
        format.json { head :no_content }
        format.js   { }
      else
        format.html { render action: 'edit' }
        format.json { render json: @helpful.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helpfuls/1
  # DELETE /helpfuls/1.json
  def destroy
    @helpful.destroy
    respond_to do |format|
      format.html { } # redirect_to helpfuls_url }
      format.json { head :no_content }
      format.js   { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helpful
      @helpful = Helpful.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def helpful_params
      params.require(:helpful).permit(:user_id, :review)
    end
    
    def load_helpfulness
	   #modelclass = [Medication].detect { |c| params["#{c.name.underscore}_id"]}
	   # @helpfulness = modelclass.find(params["#{modelclass.name.underscore}_id"])
    # @helpfulness = Medication.find(params[:medication_id])
       resource, id = request.path.split('/')[1, 2]
       @helpfulness = resource.singularize.classify.constantize.find(id)
    end 
end
