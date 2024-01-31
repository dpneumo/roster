# frozen_string_literal: true

require 'test_helper'

class PersonPhoneNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user_one)
    @person = people(:pers_valid)
  end

  test 'should get phone numbers of a person' do  
    get person_phone_numbers_url(@person)
    assert_response :success
  end
end
