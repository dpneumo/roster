# frozen_string_literal: true

class Contributions::GetForHouseAndYear < ApplicationQuery
  def initialize(house_id, year)
    @house_id = house_id
    @year = year
    super()
  end

  def call
    Contribution.where(house_id: @house_id, date_paid: year_range(@year))
  end

  def year_range(yr)
    "#{yr}-01-01".."#{yr}-12-31"
  end
end
