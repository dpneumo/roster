# frozen_string_literal: true

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @per = people(:pers_valid)
  end

  test 'can save a valid person' do
    assert @per.save
  end

  test 'first must be present' do
    @per.first = ''
    refute @per.save, 'Saved person without first'
  end

  test 'last must be present' do
    @per.last = ''
    refute @per.save, 'Saved person without last'
  end

  test 'accesses owned houses via properties association' do
    assert_equal ['Oak Dr', 'aaa'], @per.properties.map {|h| h.street }.sort
  end
end
