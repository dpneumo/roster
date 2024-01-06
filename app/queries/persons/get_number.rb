# frozen_string_literal: true

class Persons::GetNumber < ApplicationQuery
  def initialize(house_id)
    @house_id = house_id
    super()
  end

  def call
    House.where(id: @house_id).first.number
  end
end
