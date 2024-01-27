# frozen_string_literal: true

require 'test_helper'

class PositionPresenterTest < ActiveSupport::TestCase
  setup do
    @position = positions(:valid)
    @presenter = PositionPresenter.new(@position, nil)
  end

  test 'the truth is out there' do  
    assert true
  end
end
