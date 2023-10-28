# frozen_string_literal: true

require 'test_helper'

class ContributionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contribution = contributions(:one)
    @house = houses(:one)
    sign_in users(:one)
  end

  test 'should get index' do
    get contributions_url
    assert_response :success
  end

  test 'should get new' do
    get new_contribution_url(house_id: @house.id)
    assert_response :success
  end

  test 'should create contribution' do
    @house = houses(:one)
    assert_difference('Contribution.count') do
      post contributions_url,
           params: { contribution: { amount: '123.45', date_paid: Date.today,
                                     house_id: @house.id } }
    end

    contribution_id = Contribution.where(amount_cents: 12345).last.id
    assert_redirected_to contribution_url(contribution_id)
  end

  test 'should show contribution' do
    get contribution_url(@contribution)
    assert_response :success
  end

  test 'should get edit' do
    get edit_contribution_url(@contribution)
    assert_response :success
  end

  test 'should update contribution' do
    patch contribution_url(@contribution),
          params: { contribution: { amount: @contribution.amount, date_paid: @contribution.date_paid,
                                    house_id: @contribution.house_id } }
    assert_redirected_to contribution_url(@contribution)
  end

  test 'should destroy contribution' do
    assert_difference('Contribution.count', -1) do
      delete contribution_url(@contribution)
    end

    assert_redirected_to contributions_url
  end
end
