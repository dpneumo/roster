# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show detail edit update destroy]

  # GET /people
  def index
    @q = Person.includes(:house)
               .order(last: :asc, first: :asc, middle: :asc)
               .ransack(params[:q])
    @pagy, @people = pagy(@q.result)
  end

  # GET /people/1
  def show; end

  # GET /people/1/detail
  def detail; end

  # GET /people/new
  def new
    @person = Person.new
    @disable_house_select = false
  end

  # GET /people/occupant/<house_id>
  def new_occupant
    redirect_to houses_path and return unless house_id
    @person = Person.new(house_id: house_id)
    @disable_house_select = true
  end

  # GET /people/1/edit
  def edit
    @disable_house_select = false
  end

  # POST /people
  def create
    @person = Person.create(person_params)
    if @person.save
      redirect_to person_path(@person), notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to person_path(@person), notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end

  def houses
    @target = params[:target]
    @house_numbers = Houses::GetSortedNumbers.call(params[:street])

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:nickname, :first, :middle, :last, :suffix, :honorific,
                                   :note, :house_id, :role, :status)
  end

  def house_id
    @house_id ||= existing_house_id
  end

  def existing_house_id
    House.find(house_id_as_UUID_from_params).id
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def house_id_as_UUID_from_params
    params[:house_id].match(SharedRegexp::UUID_FORMAT)[0]
  end
end
