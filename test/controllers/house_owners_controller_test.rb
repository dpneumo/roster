# frozen_string_literal: true

require 'test_helper'

class HouseOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @house = houses(:valid)
  end

  test 'should get house owners' do  
    get house_owners_url(@house)
    assert_response :success
  end
end
