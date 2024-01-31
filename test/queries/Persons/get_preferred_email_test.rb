# frozen_string_literal: true

require 'test_helper'

class GetPreferredEmailTest < ActiveSupport::TestCase
  test 'return the email marked preferred for a person' do 
    person = people(:pers_valid)
    email = emails(:em_valid)
    rslt = Persons::GetPreferredEmail.new(person.id).call
    assert_equal email.id, rslt.id
  end

  test 'return nil if there is no email marked preferred for a person' do
    person = people(:pers_valid2)
    assert_nil Persons::GetPreferredEmail.new(person.id).call
  end
end
