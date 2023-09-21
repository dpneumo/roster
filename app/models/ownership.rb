# frozen_string_literal: true

class Ownership < ApplicationRecord
  belongs_to :property, class_name: 'House', foreign_key: :house_id
  belongs_to :owner, class_name: 'Person', foreign_key: :person_id

  validates :house_id,  presence: true
  validates :person_id, presence: true
end
