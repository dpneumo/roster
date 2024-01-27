# frozen_string_literal: true

class NonOccupantPresenter < ApplicationPresenter
  def topic_house(house_id)
    house = House.find(house_id)
    HousePresenter.new(house, nil).house_address
  end
end
