# frozen_string_literal: true

require 'test_helper'

class PhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:ph_valid)
    login_as(users(:user_one))
  end

  test 'should get index' do
    get phones_url
    assert_response :success
  end

  test 'should get new' do
    @person = people(:pers_valid)
    get new_phone_url(person_id: @person.id)
    assert_response :success
  end

  test 'should create phone' do
    @person = people(:pers_valid)
    assert_difference('Phone.count') do
      post phones_url, params: { phone: { person_id: @person.id, cc: '1',
                                          area: '234', prefix: '567', number: '8901',
                                          phone_type: 'cell', preferred: 'no',
                                          txt_capable: 'yes' } }
    end
    ph = Phone.where(number: '8901').first
    assert_redirected_to phone_url(ph.id)
  end

  test 'should show phone' do
    get phone_url(@phone)
    assert_response :success
  end

  test 'should get edit' do
    get edit_phone_url(@phone)
    assert_response :success
  end

  test 'should update phone' do
    patch phone_url(@phone), params: { phone: { cc: @phone.cc,
                                                area: @phone.area, prefix: @phone.prefix, number: @phone.number,
                                                phone_type: @phone.phone_type, preferred: @phone.preferred,
                                                txt_capable: @phone.txt_capable } }
    assert_redirected_to phone_url(@phone)
  end

  test 'should destroy phone' do
    assert_difference('Phone.count', -1) do
      delete phone_url(@phone)
    end

    assert_redirected_to phones_url
  end
end
