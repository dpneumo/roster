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

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:house_id] },
      { elements: [:date_paid] },
      { elements: [:amount] },
      { elements: [:amount_currency] },
      { elements: [:submit_cncl] },
    ]
  end

  def element_info 
    {
      house_id:     { kind: :select, span: 3, lblfor: 'contributions_house_id', lbltxt: 'House', 
                      collection: house_list, blank: true, prompt: true },
      date_paid:    { kind: :date,   span: 1, lblfor: 'contributions_date_paid', lbltxt: 'Date Paid' },
      amount: { kind: :text,   span: 1, lblfor: 'contributions_amount', lbltxt: 'Amount' },
      amount_currency: { kind: :text,   span: 1, lblfor: 'contributions_amount_currency', lbltxt: 'Currency' },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: contributions_path },
    } 
  end
end
