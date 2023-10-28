# frozen_string_literal: true

require 'test_helper'

class ContributionTest < ActiveSupport::TestCase
  setup do
    @cntrb = contributions(:one)
  end

  test 'a valid contribution succeeds' do
    assert @cntrb.save
  end

  test 'house_id must be present' do
    @cntrb.house_id = nil
    refute @cntrb.save, 'Saved contribution without house_id'
  end

  test 'date_paid must be present' do
    @cntrb.date_paid = nil
    refute @cntrb.save, 'Saved contribution without date_paid'
  end

  test 'amount_cents must be present' do
    contrib = Contribution.new(house_id: 1, date_paid: '2020-12-14', amount_cents: nil)
    refute contrib.save, 'Saved contribution without amount_cents'
  end

  test 'amount_cents must be a number' do
    contrib = Contribution.new(house_id: 1, date_paid: '2020-12-14', amount_cents: 'abc')
    refute contrib.save, 'contribution amount not a number'
  end
end
