# frozen_string_literal: true

require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  setup do
    @ph = phones(:one)
    @ph2 = phones(:two)
  end

  test 'Can save a valid phone' do
    assert @ph.save, 'Failed to save a valid phone'
  end

  test 'person_id must be present' do
    @ph.person_id = nil
    refute @ph.save, 'Saved phone without person_id'
  end

  test 'area must be present' do
    @ph.area = ''
    refute @ph.save, 'Saved phone without area'
  end

  test 'prefix must be present' do
    @ph.prefix = ''
    refute @ph.save, 'Saved phone without prefix'
  end

  test 'number must be present' do
    @ph.number = ''
    refute @ph.save, 'Saved phone without number'
  end

  # Schema tests (db enforces)
  test 'cc defaults to 1' do
    assert_equal '1', @ph2.cc
  end

  test 'preferred defaults to false' do
    assert_equal false, @ph2.preferred
  end

  test 'txt_capable defaults to false' do
    assert_equal false, @ph2.txt_capable
  end

  test 'note may be null' do
    assert @ph2.save, 'Save phone failed with null note'
  end

  test 'note may be blank' do
    @ph.note = ''
    assert @ph.save, 'Save phone failed with blank note'
  end
end
