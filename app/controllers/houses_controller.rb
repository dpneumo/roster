# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :set_house, only: %i[show detail edit update destroy contribs]

  # GET /houses
  def index
    @q = House.includes(:lots).ransack(params[:q])
    @q.sorts = ['street asc', 'number asc'] if @q.sorts.empty?
    @pagy, @houses = pagy(@q.result)
  end

  # GET /houses/1
  def show; end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit; end

  # POST /houses
  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to @house, notice: 'House was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /houses/1
  def update
    if @house.update(house_params)
      redirect_to @house, notice: 'House was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /houses/1
  def destroy
    @house.destroy
    redirect_to houses_url, status: :see_other, notice: 'House was successfully destroyed.'
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:number, :street, :lat, :lng, :image_link,
                                  :flag, :rental, :listed, :status, :note, lot_ids: [])
  end
end
