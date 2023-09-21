# frozen_string_literal: true

class AddressPresenter < ApplicationPresenter
  def types
    Enums.address_types
  end

  def primary
    preferred ? 'yes' : ''
  end

  def persons_list
    PersonPresenter.new(nil, nil).select_list
  end

  def complete_address
    "#{number} #{street}, #{city}, #{state} #{zip}"
  end

  def addressee
    return 'Unknown' unless person

    person.fullname
  end
end
