# frozen_string_literal: true

require 'test_helper'

class RosterControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test 'should get roster' do
    get roster_url
    assert_response :success
  end
end
