# frozen_string_literal: true

require 'test_helper'

class PersonPresenterTest < ActiveSupport::TestCase
  setup do
    @person = people(:pers_valid)
    @presenter = PersonPresenter.new(@person, nil)
  end

  test 'the truth is out there' do  
    assert true
  end
end
