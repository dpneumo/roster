class HouseOccupantsController < ApplicationController
  before_action :set_house

  def occupants
    @occupants = Person.where('house_id = ?', @house.id)
  end

private

  def  set_house
    @house = House.find(params[:id])
  end
end
