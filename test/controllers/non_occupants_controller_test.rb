# frozen_string_literal: true

require 'test_helper'

class NonOccupantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test 'get list_non_occupants_url should succeed' do
    house_id_qry = { house_id: houses(:valid).id }.to_query
    get "#{list_non_occupants_url}?#{house_id_qry}"
    assert_response :success
  end
end
