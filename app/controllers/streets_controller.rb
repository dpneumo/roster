class StreetsController < ApplicationController
  before_action :set_street, only: %i[ show edit update destroy ]

  # GET /streets or /streets.json
  def index
    @streets = Street.all
  end

  # GET /streets/1 or /streets/1.json
  def show
  end

  # GET /streets/new
  def new
    @street = Street.new
  end

  # GET /streets/1/edit
  def edit
  end

  # POST /streets or /streets.json
  def create
    @street = Street.new(street_params)

    respond_to do |format|
      if @street.save
        format.html { redirect_to street_url(@street), notice: "Street was successfully created." }
        format.json { render :show, status: :created, location: @street }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streets/1 or /streets/1.json
  def update
    respond_to do |format|
      if @street.update(street_params)
        format.html { redirect_to street_url(@street), notice: "Street was successfully updated." }
        format.json { render :show, status: :ok, location: @street }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streets/1 or /streets/1.json
  def destroy
    @street.destroy

    respond_to do |format|
      format.html { redirect_to streets_url, status: :see_other, notice: "Street was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_street
      @street = Street.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def street_params
      params.require(:street).permit(:name, :city, :state, :zip)
    end
end
