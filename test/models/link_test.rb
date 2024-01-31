# frozen_string_literal: true

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  setup do
    @valid_lnk = links(:lnk_valid)
  end

  test 'a valid link succeeds' do
    assert @valid_lnk.save
  end

  test 'house_id must be present' do
    @valid_lnk.house_id = nil
    refute @valid_lnk.save, 'Saved link without house_id'
  end

  test 'lot_id must be present' do
    @valid_lnk.lot_id = nil
    refute @valid_lnk.save, 'Saved link without lot_id'
  end
end
