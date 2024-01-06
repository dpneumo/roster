# frozen_string_literal: true

class UserPresenter < ApplicationPresenter
  def roles
    Enums.user_roles
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def assoc_name
    'None'
  end

  def instance_path
    id ? admin_user_path(self) : nil
  end

  def collection_path
   admin_users_path
  end

  def belongs_to_path
    nil
  end

  def belongs_to_name
    'None'
  end
end
