# frozen_string_literal: true

class House < ApplicationRecord
  include Comparable

  has_many :occupants,
           -> { order(last: :asc, first: :asc, middle: :asc) },
           class_name: 'Person'
  has_many :ownerships
  has_many :owners,
           -> { order(last: :asc, first: :asc, middle: :asc) },
           through: :ownerships
  has_many :contributions,
           -> { order(date_paid: :asc) }
  has_many :links
  has_many :lots, through: :links

  validate :lat_is_sane
  validate :lng_is_sane

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "current_dues", "flag", "id", "image_link", "lat", "listed", "lng", "note", "number", "rental", "status", "street", "updated_at"]
  end

  def self.sorted_streets
    Houses::GetSortedStreets.call
  end

  def <=>(other)
    return -1 if street < other.street
    return +1 if street > other.street
    number <=> other.number
  end

  private

  def lat_is_sane
    return unless lat

    if lat > 90
      errors.add(:lat, 'is > 90 deg')
    elsif lat < -90
      errors.add(:lat, 'is < -90 deg')
    end
  end

  def lng_is_sane
    return unless lng

    if lng > 180
      errors.add(:lng, 'is > 180 deg')
    elsif lng < -180
      errors.add(:lng, 'is < -180 deg')
    end
  end
end
