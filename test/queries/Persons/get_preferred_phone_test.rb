# frozen_string_literal: true

require 'test_helper'

class GetPreferredPhoneTest < ActiveSupport::TestCase
  test 'return the phone marked prefered for a person' do 
    person = people(:pers_valid)
    phone = phones(:ph_valid)
    rslt = Persons::GetPreferredPhone.new(person.id).call
    assert_equal phone.id, rslt.id
  end

  test 'return nil if there is no phone marked preferred for a person' do
    person = people(:pers_valid2)
    assert_nil Persons::GetPreferredPhone.new(person.id).call
  end
end