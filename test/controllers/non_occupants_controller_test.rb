# frozen_string_literal: true

require 'test_helper'

class NonOccupantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user_one)
    @non_occup = people(:pers_nonoccup)
    @house = houses(:hs_valid)
  end

  test 'should get index' do
    get list_non_occupants_url
    assert_response :success
  end

  test 'should update a non occupant' do  
    patch update_non_occupant_url(@non_occup), params: {house_id: @house.id}
    assert_redirected_to house_url(@house)
  end
end
