# frozen_string_literal: true

module Decorators
  module ShowErrs
    def show_errors
      return '' unless errors.any?

      h.content_tag :div, id: 'error_explanation' do
        h.content_tag(:h5, err_label) +
          h.content_tag(:ul) do
            err_msgs.map { |msg| h.content_tag(:li, msg).html_safe }
                    .join.html_safe
          end
      end
    end

    def err_label
      "#{error_count} prohibited this #{model_name} from being saved:"
    end

    def error_count
      h.pluralize(errors.count, 'error')
    end

    def model_name
      self.class.name.demodulize
    end

    def err_msgs
      errors.full_messages
    end
  end
end
