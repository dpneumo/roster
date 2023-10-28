# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @usr1 = users(:one)
  end

  test 'std_name returns user email if neither first or last name exist' do
    assert_equal 'a@b.c', @usr1.std_name
  end

  test 'std_name returns user full name if first and last names exist' do
    @usr1.first_name = 'A'
    @usr1.last_name = 'B'
    assert_equal 'A B', @usr1.std_name
  end

  test ' std_name returns user first name if only first name exists' do
    @usr1.first_name = 'A'
    @usr1.last_name = nil
    assert_equal 'A', @usr1.std_name
  end

  test ' std_name returns user last name if only last name exists' do
    @usr1.first_name = nil
    @usr1.last_name = 'B'
    assert_equal 'B', @usr1.std_name
  end

  test 'last name: nil & first name: white space => std_name rtns email' do
    @usr1.first_name = ' '
    @usr1.last_name = nil
    assert_equal 'a@b.c', @usr1.std_name
  end

  test 'last name: white space & first name: nil => std_name rtns email' do
    @usr1.first_name = nil
    @usr1.last_name = '   '
    assert_equal 'a@b.c', @usr1.std_name
  end
end
