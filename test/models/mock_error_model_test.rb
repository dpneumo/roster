# frozen_string_literal: true

require 'test_helper'
require 'fixtures/files/mock_error_model'

class MockErrorModelTest < ActiveSupport::TestCase
  setup do
    errs = Errs.new(['message 1', 'message 2'])
    @mdl = MockErrorModel.new(errs)
  end

  test 'responds to #model_name' do
    assert @mdl.respond_to? :model_name
  end

  test 'responds to #errors' do
    assert @mdl.respond_to? :errors
  end

  test 'responds to #errors.any?' do
    assert @mdl.errors.respond_to? :any?
  end

  test 'responds to #errors.count' do
    assert @mdl.errors.respond_to? :count
  end

  test 'responds to #errors.full_messages' do
    assert @mdl.errors.respond_to? :full_messages
  end
end
