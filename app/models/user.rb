# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #:lockable, :timeoutable, :trackable #:confirmable,

  def authenticatable_salt
    "#{super}#{session_token}"
  end

  def invalidate_session!
    update_attribute(:session_token, SecureRandom.hex)
  end

  def std_name
    return email if first_name.blank? && last_name.blank?
    return first_name if !first_name.blank? && last_name.blank?
    return last_name  if first_name.blank? && !last_name.blank?

    "#{first_name} #{last_name}"
  end
end
