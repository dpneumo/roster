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
    id ? user_path(self) : nil
  end

  def collection_path
    users_path
  end

  def belongs_to_path
    nil
  end

  def belongs_to_name
    'None'
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:email, :role] },
      { elements: [:password, :password_confirmation] },
      { elements: [:first_name, :last_name] },
      { elements: [:submit, :navlinks] },
    ]
  end

  def element_info 
    {
      email:       { kind: :text,      span: 3, lblfor: 'user_email',      lbltxt: 'Email', 
                      blank: true, prompt: true, disable_edit: true },
      first_name:  { kind: :text,      span: 3, lblfor: 'user_first_name', lbltxt: 'First Name' },
      last_name:   { kind: :text,      span: 3, lblfor: 'user_last_name',  lbltxt: 'Last Name'  },
      role:        { kind: :select,    span: 3, lblfor: 'user_role',       lbltxt: 'Role', 
                      collection: roles, default: 'user' },
      password:    { kind: :password,  span: 3, lblfor: 'user_password',   lbltxt: 'Password'   },
      password_confirmation: { kind: :password, span: 3, 
                      lblfor: 'user_password_confirmation', lbltxt: 'Password Confirmation' },
      submit:      { kind: :submit,         subtxt: 'Submit' },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: users_path },
      navlinks:    { kind: :navlinks_sl },
    } 
  end
end
