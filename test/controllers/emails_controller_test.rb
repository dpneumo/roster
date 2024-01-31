# frozen_string_literal: true

require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = emails(:em_valid)
    sign_in users(:user_one)
  end

  test 'should get index' do
    get emails_url
    assert_response :success
  end

  test 'should get new' do
    @person = people(:pers_valid)
    get new_email_url(person_id: @person.id)
    assert_response :success
  end

  test 'should create email' do
    @person = people(:pers_valid)
    assert_difference('Email.count') do
      post emails_url, params: { email: { person_id: @person.id, addr: 'q@r.s', note: '' } }
    end

    email_id = Email.where(addr:'q@r.s').last.id
    assert_redirected_to email_url(email_id)
  end

  test 'should show email' do
    get email_url(@email)
    assert_response :success
  end

  test 'should get edit' do
    get edit_email_url(@email)
    assert_response :success
  end

  test 'should update email' do
    patch email_url(@email), params: { email: { addr: @email.addr, note: @email.note } }
    assert_redirected_to email_url(@email)
  end

  test 'should destroy email' do
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_redirected_to emails_url
  end
end
