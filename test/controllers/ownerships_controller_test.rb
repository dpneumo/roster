# frozen_string_literal: true

require 'test_helper'

class OwnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ownership = ownerships(:valid)
    login_as(users(:one))
  end

  test 'should get index' do
    get ownerships_url
    assert_response :success
  end

  test 'should get new' do
    @house = houses(:valid)
    get new_ownership_url(house_id: @house.id)
    assert_response :success
  end

  test 'should create ownership' do
    per2 = people(:valid2)
    assert_difference('Ownership.count') do
      post ownerships_url, params: { ownership: { house_id: @ownership.house_id, person_id: per2.id } }
    end
    onrshp = Ownership.where(person_id: per2.id).first
    assert_redirected_to ownership_url(onrshp.id)
  end

  test 'should show ownership' do
    get ownership_url(@ownership)
    assert_response :success
  end

  test 'should get edit' do
    get edit_ownership_url(@ownership)
    assert_response :success
  end

  test 'should update ownership' do
    patch ownership_url(@ownership),
          params: { ownership: { house_id: @ownership.house_id, person_id: @ownership.person_id } }
    assert_redirected_to ownership_url(@ownership)
  end

  test 'should destroy ownership' do
    assert_difference('Ownership.count', -1) do
      delete ownership_url(@ownership)
    end

    assert_redirected_to ownerships_url
  end
end
