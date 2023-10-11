# frozen_string_literal: true

require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  setup do
    @hse1 = houses(:one)
    @hse2 = houses(:two)
  end

  test 'a valid house succeeds' do
    assert @hse1.save
  end

  test 'latitude may not be > 90' do
    @hse1.lat = 100
    refute @hse1.save, 'Saved house with too high latitude'
  end

  test 'latitude may not be < -90' do
    @hse1.lat = -100
    refute @hse1.save, 'Saved house with too low latitude'
  end

  test 'longitude may not be > 180' do
    @hse1.lng = 200
    refute @hse1.save, 'Saved house with too high longitude'
  end

  test 'longitude may not be < -180' do
    @hse1.lng = -200
    refute @hse1.save, 'Saved house with too low longitude'
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
end
