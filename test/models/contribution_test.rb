# frozen_string_literal: true

require 'test_helper'

class ContributionTest < ActiveSupport::TestCase
  setup do
    @valid_cntrb = contributions(:cntr_valid)
  end

  test 'a valid contribution succeeds' do
    assert @valid_cntrb.save
  end

  test 'house_id must be present' do
    @valid_cntrb.house_id = nil
    refute @valid_cntrb.save, 'Saved contribution without house_id'
  end

  test 'date_paid must be present' do
    @valid_cntrb.date_paid = nil
    refute @valid_cntrb.save, 'Saved contribution without date_paid'
  end

  test 'amount_cents must be present' do
    @valid_cntrb.amount_cents = nil
    refute @valid_cntrb.save, 'Saved contribution without amount_cents'
  end

  test 'amount_cents must be a number' do
    @valid_cntrb.amount_cents = 'abc'
    refute @valid_cntrb.save, 'contribution amount not a number'
  end

  test 'amount_cents must be >=0' do
    @valid_cntrb.amount_cents = -1
    refute @valid_cntrb.save, 'contribution amount less than 0'
    @valid_cntrb.amount_cents = 0
    assert @valid_cntrb.save, 'contribution amount = 0 was not saved'
    @valid_cntrb.amount_cents = 1
    assert @valid_cntrb.save, 'contribution amount = 1 was not saved'
  end

  # Schema tests (db enforces)
  test 'amount_cents defaults to 0' do
    assert_equal 0, contributions(:no_amount).amount_cents,
                  'Default amount_cents not inserted by DB'
  end

  test 'amount_currency defaults to USD' do
    assert_equal 'USD', @valid_cntrb.amount_currency,
                  'Default amount_currency not inserted by DB'
  end
end
