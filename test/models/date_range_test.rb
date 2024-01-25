# frozen_string_literal: true

require 'test_helper'

class DateRangeTest < ActiveSupport::TestCase
  def setup
    @start = Date.new(2021, 5, 10)
    @stop = Date.new(2021, 5, 12)
    @daterange = DateRange.new(@start, @stop)
  end

  test 'includes_date? returns true for start date' do
    assert @daterange.includes_date?(@start)
  end

  test 'includes_date? returns true for stop date' do
    assert @daterange.includes_date?(@stop)
  end

  test 'includes_date? returns false for date out of range' do
    assert @daterange.includes_date?(@stop - 1)
  end

  test 'includes_date_range? is true for daterange within this daterange' do
    daterange2 = DateRange.new(@start + 1, @stop - 1)
    assert @daterange.includes_date_range?(daterange2)
  end

  test 'includes_date_range? is false for daterange outside this daterange' do
    daterange2 = DateRange.new(@start - 10, @start - 1)
    refute @daterange.includes_date_range?(daterange2)
  end

  test 'includes_date_range? is true for self' do
    assert @daterange.includes_date_range?(@daterange)
  end

  test 'overlaps_date_range? is true for overlapping daterange' do
    daterange2 = DateRange.new(@start - 1, @stop - 1)
    assert @daterange.overlaps_date_range?(daterange2)
  end

  test 'overlaps_date_range? is false for non-overlapping daterange' do
    daterange2 = DateRange.new(@start - 10, @start - 1)
    refute @daterange.overlaps_date_range?(daterange2)
  end

  test 'overlaps_date_range? is false for self' do
    assert @daterange.overlaps_date_range?(@daterange)
  end

  test 'returns a string representation of self' do
    assert_equal '10-May-2021  to  12-May-2021', @daterange.to_s
  end

  test 'verifies a valid date range' do
    assert @daterange.valid?
  end

  test 'a nil start is not valid' do
    daterange = DateRange.new(nil, @stop)
    refute daterange.valid?
  end

  test 'a nil stop is not valid' do
    daterange = DateRange.new(@start, nil)
    refute daterange.valid?
  end

  test 'a non Date start is not valid' do
    daterange = DateRange.new('a', @stop)
    refute daterange.valid?
  end

  test 'a non Date stop is not valid' do
    daterange = DateRange.new(@start, 'a')
    refute daterange.valid?
  end

  test 'start must be earlier than stop to be valid' do
    daterange = DateRange.new(@stop, @start)
    refute daterange.valid?
  end

  test 'start cannot = stop to be valid' do
    daterange = DateRange.new(@start, @start)
    refute daterange.valid?
  end
end
