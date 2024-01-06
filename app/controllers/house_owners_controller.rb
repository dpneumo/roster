class HouseOwnersController < ApplicationController
  before_action :set_house

  def owners
    @owners = @house.owners
  end

private

  def  set_house
    @house = House.find(params[:id])
  end
end
