# frozen_string_literal: true

require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  setup do
    @psn = positions(:posn_valid)
    @per = people(:pers_valid)
  end

  test 'Can save a valid position' do
    assert @psn.save, 'Failed to save a valid position'
  end

  test 'name must be present' do
    @psn.name = ''
    refute @psn.save, 'Saved position without name'
  end

  test 'start must be present' do
    @psn.start = ''
    refute @psn.save, 'Saved position without start'
  end

  test 'stop must be present' do
    @psn.stop = ''
    refute @psn.save, 'Saved position without stop'
  end

  test 'stop must be after start' do
    @psn.start = Date.current
    @psn.stop = Date.yesterday
    refute @psn.save, 'Saved position with stop before start'
    @psn.stop = Date.current
    refute @psn.save, 'Saved position with stop = start'
  end

  test 'current_active_posns rtns positions currently active' do
    posns = Position.current_active_posns
    assert_equal 3, posns.count
    posn_names = posns.map(&:name)
    assert posn_names.include? 'Treasurer'
  end

  test 'posns_active_in_interval rtns positions active some time during an interval' do
    istart = Date.current.next_year.beginning_of_quarter
    istop = Date.current.next_year.end_of_quarter
    posns = Position.posns_active_in_interval(int_start: istart, int_stop: istop)
    assert_equal 1, posns.count
  end
end
