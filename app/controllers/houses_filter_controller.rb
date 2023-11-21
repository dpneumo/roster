class HousesFilterController < ApplicationController
  def index
    @house_numbers = House.where(street: params[:street]).order(:number).pluck(:id, :number)
  end
end
