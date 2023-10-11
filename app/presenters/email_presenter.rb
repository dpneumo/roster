# frozen_string_literal: true

class EmailPresenter < ApplicationPresenter
  def types
    Enums.email_types
  end

  def primary
    preferred ? 'Yes' : ''
  end

  def persons_list
    PersonPresenter.new(nil, nil).select_list
  end

  def addressee
    return 'Unknown' unless person
    person.fullname
  end

  def note_hint
    return '' unless note  
    note.length > 20 ? note.slice(0..19)+'...' : note
  end

# For New & Edit forms
  def form_rows
    [ 
      { elements: [:person_id] },
      { elements: [:addr, :email_type] },
      { elements: [:preferred] },
      { elements: [:note] },
      { elements: [:submit_cncl] },
    ]
  end

  def element_info 
    {
      person_id:   { kind: :select,    span: 3, lblfor: 'email_person_id', lbltxt: 'Person', 
                      collection: persons_list, blank: true, prompt: true },
      addr:        { kind: :text,      span: 3, lblfor: 'email_addr',      lbltxt: 'Email Address' },
      email_type:  { kind: :select,    span: 3, lblfor: 'email_email_type',lbltxt: 'Email Type', collection: types },
      preferred:   { kind: :checkbox,  span: 3, lblfor: 'email_preferred', lbltxt: 'Preferred', default: true },
      note:        { kind: :textarea,  span: 3, lblfor: 'email_note',      lbltxt: 'Note' },
      submit_cncl: { kind: :submit_or_cncl, span: 3, subtxt: 'Submit', cncltxt: 'Cancel', path: emails_path },
    } 
  end
end
