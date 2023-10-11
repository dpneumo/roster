# frozen_string_literal: true

class MockErrorModel
  attr_reader :errors

  def initialize(errors)
    @errors = errors
  end

  def model_name
    self.class.name.demodulize
  end
end

class Errs
  def initialize(messages)
    @messages = messages || []
  end

  def any?
    @messages.any?
  end

  def count
    @messages.count
  end

  def full_messages
    @messages
  end
end
