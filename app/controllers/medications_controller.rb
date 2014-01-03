class MedicationsController < ApplicationController
  before_action :set_medication, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /medications
  # GET /medications.json
  
  def helpful
    @current_user = current_user
    @medication = Medication.find(params[:id])
    if @current_user.flagged?(@medication, :helpful)
        # User has liked it, let's UNlike it
        @current_user.unflag(@medication, :helpful)
        flash[:msg] = "You have unliked this collection."           
    else
        # User has not like it yet, let's like it
        @current_user.flag(@medication, :helpful)
        flash[:msg] = "You have liked this collection!"         
    end
    redirect_to medications_path
  end
  
  def show_modal
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def index
    @search = Medication.search do
	    keywords params[:q]     
	    if params[:forma_vypuska_id].present?
	      any_of do
	        params[:forma_vypuska_id].each do |forma_vypuska_id|
	          with(:forma_vypuska_ids, forma_vypuska_id)
	        end
	      end
	    end
	    if params[:ingredient_id].present?
	      any_of do
	        params[:ingredient_id].each do |ingredient_id|
	          with(:ingredient_ids, ingredient_id)
	        end
	      end
	    end 
	    facet :forma_vypuska_ids, :ingredient_ids
	    paginate(:page => params[:page], :per_page => 9)     
    end
    @medications = @search.results
    #@medications = Medication.paginate(:page => params[:page], :per_page => 1)
    #render :layout => 'medications'
    
    respond_to do |format|
        format.html { render :layout => 'medications' }
        format.js 
        format.json { render json: @medications }
    end
  end

  # GET /medications/1
  # GET /medications/1.json
  def show
    respond_to do |format|
        format.html { render :layout => 'application' }
    end
  end

  # GET /medications/new
  def new
    @medication = Medication.new
  end

  # GET /medications/1/edit
  def edit
    respond_to do |format|
        format.html { render :layout => 'application' }
    end
  end

  # POST /medications
  # POST /medications.json
  def create
    @medication = Medication.new(medication_params)

    respond_to do |format|
      if @medication.save
        format.html { redirect_to @medication, notice: 'Medication was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medication }
      else
        format.html { render action: 'new' }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medications/1
  # PATCH/PUT /medications/1.json
  def update
    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to @medication, notice: 'Medication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications/1
  # DELETE /medications/1.json
  def destroy
    @medication.destroy
    respond_to do |format|
      format.html { redirect_to medications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication
      @medication = Medication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medication_params
      params.require(:medication).permit(:name, :description, :dosage, :sideeffects, :flaggable, :flagger, :flag, :helpful, :helpful_id, :role_ids, :helpful_ids, :user_ids)
    end
end
