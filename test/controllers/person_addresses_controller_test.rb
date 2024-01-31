# frozen_string_literal: true

require 'test_helper'

class PersonAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user_one)
    @person = people(:pers_valid)
  end

  test 'should get addresses of a person' do  
    get person_addresses_url(@person)
    assert_response :success
  end
end
