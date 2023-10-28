# frozen_string_literal: true

require 'test_helper'

class PersonNameTest < ActiveSupport::TestCase
  test 'returns a fullname' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'A B C', pn.fullname
  end

  test 'returns a sortable_name' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'C, A B', pn.sortable_name
  end

  test 'returns a informal_name' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'N C', pn.informal_name
  end

  test 'returns a formal_name' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'H A B C S', pn.formal_name
  end

  test 'nickname returns empty string if a nil provided' do
    pn = PersonName.new('A', 'B', 'C', nil, 'S', 'H')
    assert_equal '', pn.nickname
  end

  test 'nickname strips excess blank characters' do
    pn = PersonName.new('A', 'B', 'C', '  N N  ', 'S', 'H')
    assert_equal 'N N', pn.nickname
  end

  test 'padded_nickname returns empty string if a nil provided' do
    pn = PersonName.new('A', 'B', 'C', nil, 'S', 'H')
    assert_equal '', pn.padded_nick
  end

  test 'padded_nickname returns empty string if empty provided' do
    pn = PersonName.new('A', 'B', 'C', '', 'S', 'H')
    assert_equal '', pn.padded_nick
  end

  test 'padded_nickname returns the nick padded with a space character' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'N ', pn.padded_nick
  end

  test 'padded_nickname strips excess blank characters' do
    pn = PersonName.new('A', 'B', 'C', '  N N  ', 'S', 'H')
    assert_equal 'N N ', pn.padded_nick
  end

  test 'first returns empty string if a nil provided' do
    pn = PersonName.new(nil, 'B', 'C', 'N', 'S', 'H')
    assert_equal '', pn.first
  end

  test 'first strips excess blank characters' do
    pn = PersonName.new('  A  ', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'A', pn.first
  end

  test 'padded_first returns empty string if a nil provided' do
    pn = PersonName.new(nil, 'B', 'C', 'N', 'S', 'H')
    assert_equal '', pn.padded_first
  end

  test 'padded_first returns empty string if empty provided' do
    pn = PersonName.new('', 'B', 'C', 'N', 'S', 'H')
    assert_equal '', pn.padded_first
  end

  test 'padded_first returns the first padded with a space character' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'A ', pn.padded_first
  end

  test 'padded_first strips excess blank characters' do
    pn = PersonName.new('  A  ', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'A ', pn.padded_first
  end

  test 'middle returns empty string if a nil provided' do
    pn = PersonName.new('A', nil, 'C', 'N', 'S', 'H')
    assert_equal '', pn.middle
  end

  test 'middle strips excess blank characters' do
    pn = PersonName.new('A', '  B  ', 'C', 'N', 'S', 'H')
    assert_equal 'B', pn.middle
  end

  test 'padded_middle returns empty string if a nil provided' do
    pn = PersonName.new('A', nil, 'C', 'N', 'S', 'H')
    assert_equal '', pn.padded_middle
  end

  test 'padded_middle returns empty string if empty provided' do
    pn = PersonName.new('A', '', 'C', 'N', 'S', 'H')
    assert_equal '', pn.padded_middle
  end

  test 'padded_middle returns the middle padded with a space character' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'B ', pn.padded_middle
  end

  test 'padded_middle strips excess blank characters' do
    pn = PersonName.new('A', '  B  ', 'C', 'N', 'S', 'H')
    assert_equal 'B ', pn.padded_middle
  end

  test 'last returns Not Provided if a nil provided' do
    pn = PersonName.new('A', 'B', nil, 'N', 'S', 'H')
    assert_equal 'Not Provided', pn.last
  end

  test 'last strips excess blank characters' do
    pn = PersonName.new('A', 'B', '  C  ', 'N', 'S', 'H')
    assert_equal 'C', pn.last
  end

  test 'honorific returns empty string if a nil provided' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', nil)
    assert_equal '', pn.honorific
  end

  test 'honorific strips excess blank characters' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', '  H  ')
    assert_equal 'H', pn.honorific
  end

  test 'padded_honorific returns empty string if a nil provided' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', nil)
    assert_equal '', pn.padded_honorific
  end

  test 'padded_honorific returns empty string if empty provided' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', '')
    assert_equal '', pn.padded_honorific
  end

  test 'padded_honorific returns the honorific padded with a space character' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal 'H ', pn.padded_honorific
  end

  test 'padded_honorific strips excess blank characters' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', '  H  ')
    assert_equal 'H ', pn.padded_honorific
  end

  test 'suffix returns empty string if a nil provided' do
    pn = PersonName.new('A', 'B', 'C', 'N', nil, 'H')
    assert_equal '', pn.suffix
  end

  test 'suffix strips excess blank characters' do
    pn = PersonName.new('A', 'B', 'C', 'N', '  S  ', 'H')
    assert_equal 'S', pn.suffix
  end

  test 'padded_suffix returns empty string if a nil provided' do
    pn = PersonName.new('A', 'B', 'C', 'N', nil, 'H')
    assert_equal '', pn.padded_suffix
  end

  test 'padded_suffix returns empty string if empty provided' do
    pn = PersonName.new('A', 'B', 'C', 'N', '', 'H')
    assert_equal '', pn.padded_suffix
  end

  test 'padded_suffix returns the suffix padded with a space character' do
    pn = PersonName.new('A', 'B', 'C', 'N', 'S', 'H')
    assert_equal ' S', pn.padded_suffix
  end

  test 'padded_suffix strips excess blank characters' do
    pn = PersonName.new('A', 'B', 'C', 'N', '  S  ', 'H')
    assert_equal ' S', pn.padded_suffix
  end
end
