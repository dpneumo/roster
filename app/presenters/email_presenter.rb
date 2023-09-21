# frozen_string_literal: true

class EmailPresenter < ApplicationPresenter
  def types
    Enums.email_types
  end

  def primary
    preferred ? 'yes' : ''
  end

  def persons_list
    PersonPresenter.new(nil, nil).select_list
  end

  def addressee
    return 'Unknown' unless person

    person.fullname
  end
end
