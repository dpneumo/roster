# frozen_string_literal: true

class OwnershipPresenter < ApplicationPresenter
  def house_list
    HousePresenter.new(nil, nil).select_list
  end

  def people_list
    PersonPresenter.new(nil, nil).select_list
  end

  def house_address
    HousePresenter.new(property, nil).house_address
  end

  def owner_name
    owner.fullname
  end
end
