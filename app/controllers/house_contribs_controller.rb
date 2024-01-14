# frozen_string_literal: true

class HouseContribsController < ApplicationController
  before_action :set_house

  def annual
    @contribs = Contributions::GetForHouse.call(@house.id)
      .map {|itm| [ itm[1].year, itm[2] ] }
      .group_by(&:shift)
      .transform_values(&:flatten)
      .transform_values {|v| Money.new(v.inject(:+)) }
  end

  def detail
    @contribs = Contributions::GetForHouseAndYear.call(@house.id, params[:year])
  end

private
  def set_house
    @house = House.find(params[:id])
  end
end
