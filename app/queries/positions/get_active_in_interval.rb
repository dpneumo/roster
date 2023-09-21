# frozen_string_literal: true

class Positions::GetActiveInInterval < ApplicationQuery
  def initialize(int_start, int_stop)
    @int_start = int_start
    @int_stop = int_stop
    super()
  end

  def call
    Position.where('(start, stop) OVERLAPS (?, ?)', @int_start, @int_stop)
  end
end
