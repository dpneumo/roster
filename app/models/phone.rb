# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :person

  validates :person_id, presence: true
  validates :area, presence: true
  validates :prefix, presence: true
  validates :number, presence: true
end
