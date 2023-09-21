# frozen_string_literal: true

module Decorators
  module Show
    def show_row
      h.tag.div class: 'row' do
        yield if block_given?
      end
    end

    def notice(notice)
      return unless notice

      h.tag.div class: 'row' do
        h.tag.div class: 'col-sm' do
          h.tag.p notice, id: 'notice'
        end
      end.html_safe
    end

    def show(attribute, align = 'center', label = nil, width = nil)
      @attribute = attribute
      @align = align
      @label = label
      @width = width
      return unless attribute

      h.tag.div class: "col-sm#{width_txt}", style: "text-align:#{@align}" do
        h.tag.p { display }
      end.html_safe
    end

    def show_empty(width = nil)
      @width = width
      h.tag.div class: "col-sm#{width_txt}" do
        h.tag.p { ' ' }
      end.html_safe
    end

    private

    attr_accessor :output_buffer

    def display
      lbl + val
    end

    def lbl
      h.tag.strong { "#{lbl_txt}: " }
    end

    def lbl_txt
      @label || @attribute.to_s.titleize
    end

    def val
      send(@attribute).to_s
    end

    def width_txt
      return '' unless @width

      "-#{@width}"
    end
  end
end
