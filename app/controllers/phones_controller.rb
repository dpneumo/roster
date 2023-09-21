# frozen_string_literal: true

class PhonesController < ApplicationController
  before_action :set_phone, only: %i[show edit update destroy]

  # GET /phones
  def index
    @pagy, @phones = pagy(Phone.all)
  end

  # GET /phones/1
  def show; end

  # GET /phones/new
  def new
    @phone = Phone.new
    @phone.person_id = params[:person_id]
  end

  # GET /phones/1/edit
  def edit; end

  # POST /phones
  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      Persons::MakePrefUniqueForPerson.call(@phone) if @phone.preferred
      redirect_to @phone, notice: 'Phone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /phones/1
  def update
    if @phone.update(phone_params)
      Persons::MakePrefUniqueForPerson.call(@phone) if @phone.preferred
      redirect_to @phone, notice: 'Phone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /phones/1
  def destroy
    @phone.destroy
    redirect_to phones_url, notice: 'Phone was successfully destroyed.'
  end

  private

  def set_phone
    @phone = Phone.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def phone_params
    params.require(:phone).permit(:person_id, :cc,
                                  :area, :prefix, :number,
                                  :phone_type, :preferred, :txt_capable,
                                  :note)
  end
end
