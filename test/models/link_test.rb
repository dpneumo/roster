# frozen_string_literal: true

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  setup do
    @lnk = links(:one)
  end

  test 'a valid link succeeds' do
    assert @lnk.save
  end

  test 'house_id must be present' do
    @lnk.house_id = nil
    refute @lnk.save, 'Saved link without house_id'
  end

  test 'lot_id must be present' do
    @lnk.lot_id = nil
    refute @lnk.save, 'Saved link without lot_id'
  end
end
