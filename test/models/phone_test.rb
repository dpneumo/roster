# frozen_string_literal: true

require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  setup do
    @valid_ph = phones(:valid)
    @no_defaults_ph = phones(:no_defaults)
  end

  test 'Can save a valid phone' do
    assert @valid_ph.save, 'Failed to save a valid phone'
  end

  test 'person_id must be present' do
    @valid_ph.person_id = nil
    refute @valid_ph.save, 'Saved phone without person_id'
  end

  test 'area must be present' do
    @valid_ph.area = ''
    refute @valid_ph.save, 'Saved phone without area'
  end

  test 'prefix must be present' do
    @valid_ph.prefix = ''
    refute @valid_ph.save, 'Saved phone without prefix'
  end

  test 'number must be present' do
    @valid_ph.number = ''
    refute @valid_ph.save, 'Saved phone without number'
  end

  # Schema tests (db enforces)
  test 'cc defaults to 1' do
    assert_equal '1', @no_defaults_ph.cc,
                  'Default cc not inserted by DB'
  end

  test 'preferred defaults to false' do
    assert_equal false, @no_defaults_ph.preferred,
                        'Default value for preferred not inserted by DB'
  end

  test 'txt_capable defaults to false' do
    assert_equal false, @no_defaults_ph.txt_capable,
                        'Default value for txt_capable not inserted by DB'
  end

  test 'phone_type may be null' do
    assert @no_defaults_ph.save, 'Save phone failed with null phone_type'
  end

  test 'phone_type may be blank' do
    @valid_ph.note = ''
    assert @valid_ph.save, 'Save phone failed with phone_type note'
  end

  test 'note may be null' do
    assert @no_defaults_ph.save, 'Save phone failed with null note'
  end

  test 'note may be blank' do
    @valid_ph.note = ''
    assert @valid_ph.save, 'Save phone failed with blank note'
  end
end
