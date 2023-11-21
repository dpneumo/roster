# frozen_string_literal: true

class Houses::GetHousesOnStreet < ApplicationQuery
  def initialize(street)
    @street = street
    super()
  end

  def call
    House.where(street: @street).pluck(:number, :id).sort
  end
end
