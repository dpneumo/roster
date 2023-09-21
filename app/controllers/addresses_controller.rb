# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show edit update destroy]

  # GET /addresses
  def index
    @pagy, @addresses = pagy(Address.all)
  end

  # GET /addresses/1
  def show; end

  # GET /addresses/new
  def new
    @address = Address.new
    @address.person_id = params[:person_id]
  end

  # GET /addresses/1/edit
  def edit; end

  # POST /addresses
  def create
    @address = Address.new(address_params)
    if @address.save
      Persons::MakePrefUniqueForPerson.call(@address) if @address.preferred
      redirect_to @address, notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      Persons::MakePrefUniqueForPerson.call(@address) if @address.preferred
      redirect_to @address, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
    redirect_to addresses_url, notice: 'Address was successfully destroyed.'
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:address).permit(:person_id,
                                    :number, :street, :city, :state, :zip,
                                    :address_type, :preferred, :note)
  end
end
