# frozen_string_literal: true

class Houses::GetSortedNumbers < ApplicationQuery
  def initialize(street=nil)
    @street = street
    super()
  end

  def call
    if @street
      House.where(street: @street).pluck(:number, :id).sort
    else
      House.pluck(:number, :id).sort
    end
  end
end
