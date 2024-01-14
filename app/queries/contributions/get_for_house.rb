# frozen_string_literal: true

class Contributions::GetForHouse < ApplicationQuery
  def initialize(house_id)
    @house_id = house_id
    super()
  end

  def call
    Contribution.where(house_id: @house_id)
                .pluck(:id, :date_paid, :amount_cents)                
  end
end
