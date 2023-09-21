# frozen_string_literal: true

class EmailsController < ApplicationController
  before_action :set_email, only: %i[show edit update destroy]

  # GET /emails
  def index
    @pagy, @emails = pagy(Email.all)
  end

  # GET /emails/1
  def show; end

  # GET /emails/new
  def new
    @email = Email.new
    @email.person_id = params[:person_id]
  end

  # GET /emails/1/edit
  def edit; end

  # POST /emails
  def create
    @email = Email.new(email_params)
    if @email.save
      Persons::MakePrefUniqueForPerson.call(@email) if @email.preferred
      redirect_to @email, notice: 'Email was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /emails/1
  def update
    if @email.update(email_params)
      Persons::MakePrefUniqueForPerson.call(@email) if @email.preferred
      redirect_to @email, notice: 'Email was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /emails/1
  def destroy
    @email.destroy
    redirect_to emails_url, notice: 'Email was successfully destroyed.'
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def email_params
    params.require(:email).permit(:person_id,
                                  :addr, :email_type, :preferred, :note)
  end
end
