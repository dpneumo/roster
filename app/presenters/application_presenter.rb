# frozen_string_literal: true

class ApplicationPresenter < SimpleDelegator
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormOptionsHelper
  include MoneyRails::ActionViewExtension
  include Rails.application.routes.url_helpers
  include Decorators::Show
  include Decorators::ShowErrs
  include Decorators::Input

  def initialize(model, view)
    @view = view
    super(model) if model
  end

  attr_reader :view
  alias h view
  alias view_context view
end
