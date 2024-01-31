# frozen_string_literal: true

require 'test_helper'

class HousesFilterControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user_one)
  end

  test 'should get index' do
    post houses_filter_url
    assert_response :success
  end
end
