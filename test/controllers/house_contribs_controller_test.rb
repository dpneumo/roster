# frozen_string_literal: true

require 'test_helper'

class HouseContribsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user_one)
    @house = houses(:hs_valid)
  end

  test 'should get annual contribs for house' do  
    get house_annual_contribs_url(@house)
    assert_response :success
  end

  test 'should get detail contribs for house' do  
    get house_detail_contribs_url(@house)
    assert_response :success
  end
end
