# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @houses = House.all
    @registration = Registration.new
    render "registrations/new"
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      redirect_to occupants_path, notice: 'Registration successful!'
    else
      render :new
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to users_path, status: :see_other, notice: 'User registration was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def registration_params
    params.require(:registration)
          .permit(:nickname, :first, :middle, :last,
                  :relation, :status, :house_id)
  end
end
