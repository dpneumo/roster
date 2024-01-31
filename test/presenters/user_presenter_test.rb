# frozen_string_literal: true

require 'test_helper'

class UserPresenterTest < ActiveSupport::TestCase
  setup do
    @user = users(:user_one)
    @presenter = UserPresenter.new(@user, nil)
  end

  test 'the truth is out there' do  
    assert true
  end
end
