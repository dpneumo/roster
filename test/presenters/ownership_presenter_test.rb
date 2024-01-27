# frozen_string_literal: true

require 'test_helper'

class OwnershipPresenterTest < ActiveSupport::TestCase
  setup do
    @ownership = ownerships(:valid)
    @presenter = OwnershipPresenter.new(@ownership, nil)
  end

  test 'the truth is out there' do  
    assert true
  end
end
