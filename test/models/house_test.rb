# frozen_string_literal: true

require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  setup do
    @valid_hse = houses(:valid)
    @hse2 = houses(:valid2)
  end

  test 'a valid house succeeds' do
    assert @valid_hse.save
  end

  test 'latitude may not be > 90' do
    @valid_hse.lat = 100
    refute @valid_hse.save, 'Saved house with too high latitude'
  end

  test 'latitude may not be < -90' do
    @valid_hse.lat = -100
    refute @valid_hse.save, 'Saved house with too low latitude'
  end

  test 'longitude may not be > 180' do
    @valid_hse.lng = 200
    refute @valid_hse.save, 'Saved house with too high longitude'
  end

  test 'longitude may not be < -180' do
    @valid_hse.lng = -200
    refute @valid_hse.save, 'Saved house with too low longitude'
  end

  test 'implements <=> for houses based on addresses' do
    h1 = House.new(number: '1', street: 'aaa')
    h2 = House.new(number: '9', street: 'bbb')
    assert h1 < h2    # [  1, aaa ] < [ 9, bbb ]
    h1.number = '99'
    assert h1 < h2    # [ 99, aaa ] < [ 9, bbb ]
    h1.street = 'ccc'
    h1.number = '9'
    assert h1 > h2    # [ 9, ccc ] > [ 9, bbb ]
    h2.street = 'ccc'
    assert h1 == h2    # [ 9, ccc ] = [ 9, ccc ]
  end

  # Schema tests (db enforces)
  test 'flag defaults to false' do
    assert_equal false, houses(:no_defaults).flag,
                  'Default flag value not inserted by DB'
  end

  test 'rental defaults to false' do
    assert_equal false, houses(:no_defaults).rental,
                  'Default rental value not inserted by DB'
  end

  test 'listed defaults to false' do
    assert_equal false, houses(:no_defaults).listed,
                  'Default listed value not inserted by DB'
  end

  test 'status defaults to Occupied' do
    assert_equal 'Occupied', houses(:no_defaults).status,
                  'Default status value not inserted by DB'
  end

  test 'current_dues defaults to $0.00' do
    assert_equal '$0.00', houses(:no_defaults).current_dues,
                  'Default current_dues value not inserted by DB'
  end
end
