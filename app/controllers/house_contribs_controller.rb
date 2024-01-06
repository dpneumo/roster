# frozen_string_literal: true

class HouseContribsController < ApplicationController
  before_action :set_house

  def annual
    @contribs = Contributions::GetForHouse.call(@house.id)
      .group_by(&:shift)
      .transform_values(&:flatten)
      .map {|k,v| [k.year, Money.new(v.inject(:+))] }
  end

  # Not Used Yet
  def detail
    @contribs = Contributions::GetForHouse.call(@house.id)
      .group_by(&:shift)
      .transform_values(&:flatten)
  end

private
  def set_house
    @house = House.find(params[:id])
  end
end
