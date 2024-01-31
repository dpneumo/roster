# frozen_string_literal: true

require 'test_helper'

class HouseOccupantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user_one)
    @house = houses(:hs_valid)
  end

  test 'should get house occupants' do  
    get house_occupants_url(@house)
    assert_response :success
  end
end
