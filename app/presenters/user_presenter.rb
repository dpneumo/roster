# frozen_string_literal: true

class UserPresenter < ApplicationPresenter
  def roles
    Enums.user_roles
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:email, :role] },
      { elements: [:password, :first_name] },
      { elements: [:password_confirmation, :last_name] },
      { elements: [:submit_cncl] }
    ]
  end

  def element_info 
    {
      email:       { kind: :text,      span: 3, lblfor: 'user_email',      lbltxt: 'Email'      },
      first_name:  { kind: :text,      span: 3, lblfor: 'user_first_name', lbltxt: 'First Name' },
      last_name:   { kind: :text,      span: 3, lblfor: 'user_last_name',  lbltxt: 'Last Name'  },
      role:        { kind: :select,    span: 3, lblfor: 'user_role',       lbltxt: 'Role', collection: roles, default: 'user' },
      password:    { kind: :password,  span: 3, lblfor: 'user_password',   lbltxt: 'Password'   },
      password_confirmation: { kind: :password, span: 3, lblfor: 'user_password_confirmation', lbltxt: 'Password Confirmation' },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: users_path },
    } 
  end
end
