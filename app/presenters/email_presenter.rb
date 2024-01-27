# frozen_string_literal: true

class EmailPresenter < ApplicationPresenter
  def types
    Enums.email_types
  end

  def primary
    preferred ? 'Yes' : ''
  end

  def note_hint  
    return '' unless note  
    note.length > 20 ? note.slice(0..19)+'...' : note
  end

  def person_list
    PersonPresenter.new(nil, nil).select_list
  end

  def addressee
    person.fullname
  end
  alias assoc_name addressee
  alias person_fullname addressee

  def instance_path
    id ? email_path(self) : nil
  end

  def collection_path
    emails_path
  end

  def belongs_to_path
    person_id ? person_path(person_id) : nil
  end

  def belongs_to_name
    'Person'
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:person_id] },
      { elements: [:addr, :email_type] },
      { elements: [:preferred] },
      { elements: [:note] },
      { elements: [:submit, :navlinks] },
    ]
  end

  def element_info 
    {
      person_id:   { kind: :select,   lblfor: 'email_person_id', lbltxt: 'Person', 
                      collection: person_list, blank: true, prompt: true, disable_edit: true },
      addr:        { kind: :text,     lblfor: 'email_addr',      lbltxt: 'Email Address' },
      email_type:  { kind: :select,   lblfor: 'email_email_type',lbltxt: 'Email Type', collection: types },
      preferred:   { kind: :checkbox, lblfor: 'email_preferred', lbltxt: 'Preferred', default: true },
      note:        { kind: :textarea, lblfor: 'email_note',      lbltxt: 'Note' },
      submit:      { kind: :submit,         subtxt: 'Submit' },
      submit_cncl: { kind: :submit_or_cncl, subtxt: 'Submit', cncltxt: 'Cancel', path: emails_path },
      navlinks:    { kind: :navlinks_sl },
    } 
  end
end
