# frozen_string_literal: true

require 'test_helper'

class HousePresenterTest < ActiveSupport::TestCase
  setup do
    @house = houses(:valid)
    @presenter = HousePresenter.new(@house, nil)
  end

  test 'the truth is out there' do  
    assert true
  end
end
