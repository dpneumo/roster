# frozen_string_literal: true

class Positions::GetCurrentForPerson < ApplicationQuery
  def initialize(person_id)
    @person_id = person_id
    super()
  end

  def call
    Position.where("person_id = ? AND start <= '#{Date.current}' AND stop >= '#{Date.current}'", @person_id)
  end
end
