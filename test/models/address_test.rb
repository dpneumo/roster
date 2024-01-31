# frozen_string_literal: true

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @valid_addr = addresses(:addr_valid)
    @invalid_addr = addresses(:addr_invalid)
  end

  test 'a valid address succeeds' do
    assert @valid_addr.save
  end

  test 'person_id must be present' do
    @valid_addr.person_id = nil
    refute @valid_addr.save, 'Saved address without person_id'
  end

  test 'number must be present' do
    @valid_addr.number = ''
    refute @valid_addr.save, 'Saved address without number'
  end

  test 'street must be present' do
    @valid_addr.street = ''
    refute @valid_addr.save, 'Saved address without street'
  end

  test 'city must be present' do
    @valid_addr.city = ''
    refute @valid_addr.save, 'Saved address without city'
  end

  test 'state must be present' do
    @valid_addr.state = ''
    refute @valid_addr.save, 'Saved address without state'
  end

  test 'zip must be present' do
    @valid_addr.zip = ''
    refute @valid_addr.save, 'Saved address without zip'
  end

  test 'returns a formatted address' do
    assert_equal '123A Oak Dr, Arlington, TX 76016', @valid_addr.address 
  end

  # Schema tests (db enforces)
  test 'address_type defaults to Home' do
    assert_equal 'Home', @invalid_addr.address_type,
                  'Default address_type not inserted by DB'
  end

  test 'state defaults to Tx' do
    assert_equal 'TX', @invalid_addr.state,
                  'Default state not inserted by DB'
  end

  test 'preferred defaults to false' do
    assert_equal false, @invalid_addr.preferred,
                  'Default preferred value not inserted by DB'
  end

  test 'note may be null' do
    assert @invalid_addr.save, 'Save address failed with null note'
  end

  test 'note may be blank' do
    @valid_addr.note = ''
    assert @valid_addr.save, 'Save address failed with blank note'
  end
end
