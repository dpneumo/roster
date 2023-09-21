# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :house
  belongs_to :lot, class_name: 'House'

  validates :house_id, presence: true
  validates :lot_id, presence: true
end
