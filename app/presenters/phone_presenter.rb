# frozen_string_literal: true

class PhonePresenter < ApplicationPresenter
  def types
    Enums.phone_types
  end

  def primary
    preferred ? 'yes' : ''
  end

  def persons_list
    PersonPresenter.new(nil, nil).select_list
  end

  def ph_number
    "(#{area}) #{prefix}-#{number}"
  end

  def person_name
    return 'Unknown' unless person

    person.fullname
  end
end
