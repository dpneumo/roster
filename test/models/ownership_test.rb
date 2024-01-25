# frozen_string_literal: true

require 'test_helper'

class OwnershipTest < ActiveSupport::TestCase
  setup do
    @valid_own = ownerships(:valid)
  end

  test 'a valid ownership succeeds' do
    assert @valid_own.save
  end

  test 'house_id must be present' do
    @valid_own.house_id = ''
    refute @valid_own.save, 'Saved ownership without house_id'
  end

  test 'person_id must be present' do
    @valid_own.person_id = ''
    refute @valid_own.save, 'Saved ownership without person_id'
  end

  test 'accesses houses through property association' do
    hse = houses(:valid)
    pers = people(:valid2)
    ownership = Ownership.new(house_id: hse.id, person_id: pers.id)
    assert_equal hse.id, ownership.property.id
  end

  test 'accesses people through owner association' do
    hse = houses(:valid)
    pers = people(:valid)
    ownership = Ownership.new(house_id: hse.id, person_id: pers.id)
    assert_equal pers.id, ownership.owner.id
  end
end
