# frozen_string_literal: true

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @per = people(:one)
  end

  test 'a valid person succeeds' do
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

  test 'person_name returns a new PersonName' do
    assert_equal PersonName, @per.person_name.class
  end

  test 'person_name= sets self values' do
    pn = PersonName.new('a', 'b', 'c', 'Starwalker', 'e', 'f')
    @per.person_name = pn
    assert_equal 'Starwalker', @per.nickname
  end

  test 'accesses owned houses via properties association' do
    assert_equal 'Oak Dr', @per.properties.first.street
  end
end
