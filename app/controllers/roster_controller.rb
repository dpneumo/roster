# frozen_string_literal: true

class RosterController < ApplicationController
  
  # GET /roster
  def roster
    @pagy, @houses = pagy(Houses::GetForRoster.call, items: 5, size: [1,3,3,1])
    @report = true
  end
end


