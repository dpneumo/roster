# frozen_string_literal: true

require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
    login_as(users(:one))
  end

  test 'should get index' do
    get people_url
    assert_response :success
  end

  test 'should get new' do
    get new_person_url
    assert_response :success
  end

  test 'should get new occupant' do
    get new_occupant_url(houses(:one).id)
    assert_response :success
  end

  test 'should create person' do
    assert_difference('Person.count') do
      post people_url,
           params: { person: { first: @person.first, honorific: @person.honorific, last: @person.last, middle: @person.middle,
                               nickname: @person.nickname, note: @person.note, suffix: @person.suffix } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test 'should show person' do
    get person_url(@person)
    assert_response :success
  end

  test 'should return person detail' do
    get person_detail_url(@person)
    assert_response :success
  end

  test 'should get edit' do
    get edit_person_url(@person)
    assert_response :success
  end

  test 'should update person' do
    patch person_url(@person),
          params: { person: { first: @person.first, honorific: @person.honorific, last: @person.last, middle: @person.middle,
                              nickname: @person.nickname, note: @person.note, suffix: @person.suffix } }
    assert_redirected_to person_url(@person)
  end

  test 'should destroy person' do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
