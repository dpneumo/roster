# frozen_string_literal: true

require 'test_helper'

class GetPreferredAddressTest < ActiveSupport::TestCase
  test 'return the address marked prefered for a person' do 
    person = people(:valid)
    address = addresses(:valid)
    rslt = Persons::GetPreferredAddress.new(person.id).call
    assert_equal address.id, rslt.id
  end

  test 'return nil if there is no address marked preferred for a person' do
    person = people(:valid2)
    assert_nil Persons::GetPreferredAddress.new(person.id).call
  end
end
