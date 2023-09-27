# frozen_string_literal: true

class Houses::GetSortedStreets < ApplicationQuery
  def initialize()
    super()
  end

  def call
     House.distinct.pluck(:street).sort                
  end
end
