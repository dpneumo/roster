# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :person

  validates :number, presence: true
  validates :street, presence: true
  validates :city,   presence: true
  validates :state,  presence: true
  validates :zip,    presence: true

  def address
    "#{number} #{street}, #{city}, #{state} #{zip}"
  end
end
