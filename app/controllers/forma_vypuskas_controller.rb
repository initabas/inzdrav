class FormaVypuskasController < ApplicationController
  before_action :set_forma_vypuska, only: [:show, :edit, :update, :destroy]

  # GET /forma_vypuskas
  # GET /forma_vypuskas.json
  def index
    @forma_vypuskas = FormaVypuska.all
  end

  # GET /forma_vypuskas/1
  # GET /forma_vypuskas/1.json
  def show
  end

  # GET /forma_vypuskas/new
  def new
    @forma_vypuska = FormaVypuska.new
  end

  # GET /forma_vypuskas/1/edit
  def edit
  end

  # POST /forma_vypuskas
  # POST /forma_vypuskas.json
  def create
    @forma_vypuska = FormaVypuska.new(forma_vypuska_params)

    respond_to do |format|
      if @forma_vypuska.save
        format.html { redirect_to @forma_vypuska, notice: 'Forma vypuska was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forma_vypuska }
      else
        format.html { render action: 'new' }
        format.json { render json: @forma_vypuska.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forma_vypuskas/1
  # PATCH/PUT /forma_vypuskas/1.json
  def update
    respond_to do |format|
      if @forma_vypuska.update(forma_vypuska_params)
        format.html { redirect_to @forma_vypuska, notice: 'Forma vypuska was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forma_vypuska.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forma_vypuskas/1
  # DELETE /forma_vypuskas/1.json
  def destroy
    @forma_vypuska.destroy
    respond_to do |format|
      format.html { redirect_to forma_vypuskas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forma_vypuska
      @forma_vypuska = FormaVypuska.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forma_vypuska_params
      params.require(:forma_vypuska).permit(:name)
    end
end
