# frozen_string_literal: true

class Contribution < ApplicationRecord
  belongs_to :house

  validates :house_id,  presence: true
  validates :date_paid, presence: true

  monetize :amount_cents, numericality: true
end
