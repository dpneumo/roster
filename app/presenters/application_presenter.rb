# frozen_string_literal: true

class ApplicationPresenter < SimpleDelegator
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormOptionsHelper
  include MoneyRails::ActionViewExtension
  include Rails.application.routes.url_helpers

  def initialize(model, view)
    @view = view
    super(model) if model
  end

  attr_reader :view
  alias h view
  alias view_context view

  # Decorators::Input residual
  def form=(form)
    @form = form
  end

  def form
    @form
  end

  # Decorators:Show residual
  def notice(notice)
    return unless notice

    h.tag.div class: 'row' do
      h.tag.div class: 'col-sm' do
        h.tag.p notice, id: 'notice'
      end
    end.html_safe
  end

  # Common Presenter methods
  def house_addr
    "#{house_number} #{house_street}"
  end

  def house_street
    return '' unless house_id
    House.find(house_id).street
  end

  def house_number
    return '' unless house_id
    House.find(house_id).number 
  end

  def street_names
    Houses::GetSortedStreets.call
  end

  def street_numbers(street=nil)
    Houses::GetSortedNumbers.new(street).call
  end

end
