# frozen_string_literal: true

class Enums
  def self.address_types
    %w[Home Work Other]
  end

  def self.email_types
    %w[Home Work Other]
  end

  def self.phone_types
    %w[Cell Home Work Other]
  end

  def self.house_statuses
    %w[Occupied Vacant Construction]
  end

  def self.person_roles
    %w[Husband Wife Partner Child Guest Other Unknown]
  end

  def self.person_statuses
    %w[Owner Renter Other Unknown]
  end

  def self.officers
    %w[President Vice\ President Secretary Treasurer]
  end

  def self.chairs
    %w[Landscape Social Security New\ Member]
  end

  def self.user_roles
    %w[user admin]
  end
end
