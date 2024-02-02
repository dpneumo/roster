# frozen_string_literal: true

require 'test_helper'

class UserPresenterTest < ActiveSupport::TestCase
  setup do
    @user = users(:user_two)
    @presenter = UserPresenter.new(@user, nil)
  end

  test 'returns an assay of roles' do 
    assert_instance_of Array, @presenter.roles
  end

  test 'returns full name' do 
    assert_equal 'George Harrison', @presenter.full_name
  end

  test 'returns assoc_name' do 
    assert_equal 'None', @presenter.assoc_name
  end

  test 'returns instance_path' do 
    assert_equal "/admin/users/#{ @user.id }", @presenter.instance_path
  end

  test 'returns collection_path' do 
    assert_equal '/admin/users', @presenter.collection_path
  end

  test 'returns nil for belongs_to_path' do 
    assert_nil @presenter.belongs_to_path
  end

  test 'returns None for belongs_to_name' do 
    assert_equal 'None', @presenter.belongs_to_name
  end
end
