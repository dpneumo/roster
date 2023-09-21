# frozen_string_literal: true

class OwnershipsController < ApplicationController
  before_action :set_ownership, only: %i[show edit update destroy]

  # GET /ownerships
  def index
    @pagy, @ownerships = pagy(Ownership.all)
  end

  # GET /ownerships/1
  def show; end

  # GET /ownerships/new
  def new
    @ownership = Ownership.new
    @ownership.house_id = params[:house_id]
  end

  # GET /ownerships/1/edit
  def edit; end

  # POST /ownerships
  def create
    @ownership = Ownership.new(ownership_params)
    if @ownership.save
      redirect_to @ownership, notice: 'Ownership was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ownerships/1
  def update
    if @ownership.update(ownership_params)
      redirect_to @ownership, notice: 'Ownership was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ownerships/1
  def destroy
    @ownership.destroy
    redirect_to ownerships_url, notice: 'Ownership was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ownership
    @ownership = Ownership.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ownership_params
    params.require(:ownership).permit(:house_id, :person_id)
  end
end
