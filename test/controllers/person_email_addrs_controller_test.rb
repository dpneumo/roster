# frozen_string_literal: true

require 'test_helper'

class PersonEmailAddrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user_one)
    @person = people(:pers_valid)
  end

  test 'should get email addresses of a person' do  
    get person_email_addrs_url(@person)
    assert_response :success
  end
end
