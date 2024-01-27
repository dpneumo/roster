# frozen_string_literal: true

require 'test_helper'

class WelcomePresenterTest < ActiveSupport::TestCase
  setup do
    @presenter = WelcomePresenter.new(nil, nil)
  end

  test 'the truth is out there' do  
    assert true
  end
end
