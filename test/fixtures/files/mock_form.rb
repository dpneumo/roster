# frozen_string_literal: true

class MockForm
  def initialize; end

  def label(attribute, label = nil, _html_opts = nil)
    label ||= attribute
    txt = "<div>#{"LBL#{label.to_s.capitalize}"}</div>"
    txt.html_safe
  end

  def text_field(attribute, _options = nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def text_area(attribute, _options = nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def check_box(attribute, _html_opts = nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def date_select(attribute, _options = nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def select(attribute, _collection, _method_opts = nil, _html_opts = nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end
end
