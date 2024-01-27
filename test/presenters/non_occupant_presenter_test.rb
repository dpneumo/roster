# frozen_string_literal: true

require 'test_helper'

class NonOccupentPresenterTest < ActiveSupport::TestCase
  setup do
    @nonoccupant = people(:nonoccupant)
    @presenter = NonOccupantPresenter.new(@nonoccupant, nil)
  end

  test 'the truth is out there' do  
    assert true
  end
end
