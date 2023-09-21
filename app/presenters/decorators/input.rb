# frozen_string_literal: true

module Decorators
  module Input
    def form=(form)
      @form = form
    end

    def form
      @form
    end

    def form_container
      h.content_tag(:div, class: "space-y-8") do
        yield
      end
    end

    def grid_container
      h.content_tag(:div, class: "border-b border-red-900/10 pb-12") do
        yield
      end
    end

    def grid_header(header='Grid Header')
      h.content_tag(:h2, class: "text-base font-semibold leading-7 text-gray-900") { header }
    end

    def grid_descr(description='Grid Description')
      h.content_tag(:p, class: "mt-1 text-sm leading-6 text-gray-600") { description }
    end

    def grid
      h.content_tag :div, class: "grid grid-cols-1 sm:grid-cols-6 mt-10 gap-x-6 gap-y-6" do
        yield
      end
    end

    def input_row(fields)
      fields.map do |f|
        case f[:kind]
        when :text        then text(f)
        when :password    then password(f)
        when :textarea    then textarea(f)
        when :checkbox    then checkbox(f)
        when :date_select then date_select(f)
        when :select      then std_select(f)
        when :hidden      then hidden(f)
        else raise "Unknown kind #{f[:kind]}"
        end
      end.join.html_safe
    end

    # text accepts in f: attribute, width
    def text(f)
      p "In text method:  f: #{f.inspect}"
      span = wtxt(f[:start],f[:width])
      h.content_tag(:div, class: span) do
        h.content_tag(:label, lbltxt(f), for: lblfor(f), class: "block text-sm font-medium leading-6 text-gray-900 #{span}") +
        h.content_tag(:div, class: "mt-2") do
          h.content_tag(:div, class: "flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 bg-red-400 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md") do
            @form.text_field( f[:attribute], 
                              class: "block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" )
          end
        end                            
      end
    end

    # text accepts in f: attribute, width
    def password(f)
      p "In text method:  f: #{f.inspect}"
      span = wtxt(f[:start],f[:width])
      h.content_tag(:div, class: span) do
        h.content_tag(:label,  lbltxt(f), for: lblfor(f), class: "block text-sm font-medium leading-6 text-gray-900 #{span}") +
        h.content_tag(:div, class: "mt-2") do
          h.content_tag(:div, class: "flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md") do
            @form.password_field( f[:attribute], 
                                  class: "block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" )
          end
        end                            
      end
    end

    # textarea accepts: label, width
    def textarea(f)
      p "In textarea method:  f: #{f.inspect}"
      h.content_tag(:div, class: "form-group col-#{f[:width] || wtxtarea}") do
        @form.label(f[:attribute], f[:label])
        @form.text_area(f[:attribute], rows: f[:rows], class: 'form-control')
      end
    end

    # checkbox accepts: label, width
    def checkbox(f)
      h.content_tag :div, class: "form-check form-check-inline col-#{f[:width] || wckbox} mb-3" do
        @form.check_box(f[:attribute], class: 'form-check-input') +
          @form.label(f[:attribute], f[:label], class: 'form-check-label')
      end
    end

    # date_select accepts: label, width
    def date_select(f)
      h.content_tag :div, class: "form-group col-#{f[:width] || wdtsel}" do
        @form.label(f[:attribute], f[:label]) +
          @form.date_select(f[:attribute], class: 'form-control')
      end
    end

    # select accepts: label, width, collection, selected, blank, multiple, hidden_mirror, disabled
    def std_select(f)
      p "In select method:  f: #{f.inspect}"
      rslt = h.content_tag :div, class: wtxt(f[:start],f[:width]) do
        h.content_tag(:label, for: lblfor(f), class: "block text-sm font-medium leading-6 text-gray-900") { lbltxt(f) } +
        @form.select( f[:attribute], f[:collection],
                      { include_blank: f[:blank], selected: f[:selected] },
                      { class: "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6",
                      multiple: f[:multiple], hidden: f[:hidden_mirror], disabled: f[:disabled] })
      end
      hdn = f[:disabled] ? hidden(f) : ''
      rslt + hdn
    end

    # hidden accepts: value
    def hidden(f)
      @form.hidden_field(f[:attribute], value: f[:value]) if f[:value]
    end

    private

    def lblfor(f)
      "#{form.object_name}_#{f[:attribute].to_s}"
    end

    def lbltxt(f)
      f[:label] || f[:attribute].to_s.humanize
    end

    def wtxt(start=1,width=1)
        #"col-start-#{start} col-end-#{start+width}" 
        "col-span-#{width}"
    end

    def wtxtarea
      9
    end

    def wckbox
      3
    end

    def wdtsel(width=3)
      "col-span-#{width}"
    end

    def wsel(width=1)
      "col-span-#{width}"
    end
  end
end
