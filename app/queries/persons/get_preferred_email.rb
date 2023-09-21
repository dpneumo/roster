# frozen_string_literal: true

class Persons::GetPreferredEmail < ApplicationQuery
  def initialize(person_id)
    @person_id = person_id
    super()
  end

  def call
    Email.where(person_id: @person_id, preferred: true).first
  end
end

