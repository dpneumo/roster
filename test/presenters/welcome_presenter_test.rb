# frozen_string_literal: true

require 'test_helper'

class WelcomePresenterTest < ActiveSupport::TestCase
  setup do
    @presenter = WelcomePresenter.new(nil, nil)
  end

  test 'returns total current dues' do
    house = houses(:hs_valid)
    Contribution.new(house: house, date_paid: '2024-01-22', amount_cents: 1000).save 
    Contribution.new(house: house, date_paid: '2024-09-17', amount_cents: 200).save  
    stmnt = 'Total Dues Paid 2024:        $12.00'
    assert_equal stmnt, @presenter.total_dues_current
  end

  test 'returns total last year dues' do
    house = houses(:hs_valid)
    Contribution.new(house: house, date_paid: '2023-01-22', amount_cents: 2000).save 
    Contribution.new(house: house, date_paid: '2023-09-17', amount_cents: 400).save  
    stmnt = 'Total Dues Paid 2023:        $24.00'
    assert_equal stmnt, @presenter.total_dues_last_year
  end
end
