# frozen_string_literal: true

class ContributionPresenter < ApplicationPresenter
  def for(house_id:, year: Date.current.year)
    contribs = Contributions::GetForHouseAndYear.call(house_id, year)
    contribs.reduce(0) { |sum, c| sum + c.amount_cents }
  end

  def total_for(year: Date.current.year)
    contribs = Contributions::GetForYear.call(year)
    contribs.reduce(0) { |sum, c| sum + c.amount_cents }
  end

  def house_list
    House.all.map { |h| [HousePresenter.new(h, nil).house_address, h.id] }
  end

  def house_address
    house ? HousePresenter.new(house, nil).house_address : ''
  end

  def year_range(yr)
    "#{yr}-01-01".."#{yr}-12-31"
  end
end
