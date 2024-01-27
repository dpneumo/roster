# frozen_string_literal: true

class ContributionPresenter < ApplicationPresenter
  def for(house_id:, year: Date.current.year)
    contribs = Contributions::GetForHouseAndYear.call(house_id, year)
    contribs.reduce(0) { |sum, c| sum + c.amount_cents }
  end

  def total_for(year: Date.current.year)
    Contributions::GetForYear.call(year)
                             .reduce(0) { |sum, c| sum + c.amount_cents }
  end

  def year_range(yr)
    "#{yr}-01-01".."#{yr}-12-31"
  end

  def house_list
    HousePresenter.new(nil, nil).select_list
  end

  def house_address
    house ? HousePresenter.new(house, nil).house_address : ''
  end
  alias assoc_name house_address

  def instance_path
    id ? contribution_path(self) : nil
  end

  def collection_path
    contributions_path
  end

  def belongs_to_path
    house_id ? house_path(house_id) : nil
  end

  def belongs_to_name
    'House'
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:house_id] },
      { elements: [:date_paid] },
      { elements: [:amount] },
      { elements: [:amount_currency] },
      { elements: [:submit, :navlinks] },
    ]
  end

  def element_info 
    {
      house_id:        { kind: :address, blank: true, prompt: true, disable_edit: true },
      date_paid:       { kind: :date,   lblfor: 'contributions_date_paid',       lbltxt: 'Date Paid' },
      amount:          { kind: :text,   lblfor: 'contributions_amount',          lbltxt: 'Amount' },
      amount_currency: { kind: :text,   lblfor: 'contributions_amount_currency', lbltxt: 'Currency' },
      submit:       { kind: :submit,         subtxt: 'Submit' },
      submit_cncl:  { kind: :submit_or_cncl, subtxt: 'Submit', cncltxt: 'Cancel', path: contributions_path },
      navlinks:     { kind: :navlinks_sla },
    } 
  end
end
