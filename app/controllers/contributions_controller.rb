# frozen_string_literal: true

class ContributionsController < ApplicationController
  before_action :set_contribution, only: %i[show edit update destroy]

  # GET /contributions
  def index
    @pagy, @contributions = pagy(Contribution.all)
  end

  # GET /contributions/1
  def show; end

  # GET /contributions/new
  def new
    @contribution = Contribution.new
    @contribution.house_id = params[:house_id]
  end

  # GET /contributions/1/edit
  def edit; end

  # POST /contributions
  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      redirect_to @contribution, notice: 'Contribution was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contributions/1
  def update
    if @contribution.update(contribution_params)
      redirect_to @contribution, notice: 'Contribution was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contributions/1
  def destroy
    @contribution.destroy
    redirect_to contributions_url, notice: 'Contribution was successfully destroyed.'
  end

  private

  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:house_id, :date_paid, :amount)
  end
end
