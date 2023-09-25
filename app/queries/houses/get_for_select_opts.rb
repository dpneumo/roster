# frozen_string_literal: true

class Houses::GetForSelectOpts < ApplicationQuery
  def initialize()
    super()
  end

  def call
    House.pluck(:street, :number, :id)                
  end
end
