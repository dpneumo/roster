# frozen_string_literal: true

class Persons::GetPreferredPhone < ApplicationQuery
  def initialize(person_id)
    @person_id = person_id
    super()
  end

  def call
    Phone.where(person_id: @person_id, preferred: true).first
  end
end

