# frozen_string_literal: true

class Houses::GetForRoster < ApplicationQuery
  def initialize()
    super()
  end

  def call
    House.order(street: :asc, number: :asc).includes(occupants: [:emails, :phones])
  end
end
